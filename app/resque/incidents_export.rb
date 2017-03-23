class IncidentsExport
  @queue = :export

  def self.perform(user_id)
    data = Incident.list(user_id)
    #TODO encoding
    xls = render_to_string(layout: false, handlers: [:axlsx], formats: [:xlsx], template: 'incidents/index.xlsx.haml', locals: {:@incidents => data}, encoding: 'UTF-8')
    SystemMailer.incidents_export(current_user, xls).deliver
  end
end
