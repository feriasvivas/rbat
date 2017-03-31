require "application_helper"

class IncidentsExport
  @queue = :export

  def self.perform(user_id)
    user = User.find(user_id)
    data = Incident.list(user_id)
    #TODO encoding
    ac = ActionController::Base.new()
    html = ac.render_to_string(layout: false, handlers: [:axlsx], formats: [:xlsx], template: 'incidents/index.xlsx.haml', locals: {:@incidents => data}, encoding: 'UTF-8')
    xls = ToSpreadsheet::Renderer.to_data(html)
    SystemMailer.incidents_export(user, xls).deliver
  end
end
