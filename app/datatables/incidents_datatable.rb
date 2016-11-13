class IncidentsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view, list)
    @view = view
    @all_incidents = list
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: @all_incidents.count,
      iTotalDisplayRecords: incidents.total_entries,
      aaData: data
    }
  end

private

  def data
    incidents.map do |incident|
      user_name = incident.user.name if incident.user
      incident_date = incident.date.strftime("%d/%m/%Y") if incident.date
      city_name = incident.city.name if incident.city
      state_name = incident.city.state.name if incident.city
      category = incident.sub_category.category.name if incident.sub_category
      sub_category = incident.sub_category.name if incident.sub_category
      verified = 'X' if incident.verified
      [
        incident.id,
        user_name,
        incident_date,
        city_name,
        state_name,
        category,
        sub_category ,
        incident.tags2string,
        verified,
        link_to("Mais...", incident)
      ]
    end
  end

  def incidents
    @incidents ||= fetch_incidents
  end

  def fetch_incidents
    incidents = @all_incidents.joins("LEFT JOIN users ON incidents.user_id = users.id LEFT JOIN sub_categories ON incidents.sub_category_id = sub_categories.id LEFT JOIN categories ON categories.id = sub_categories.category_id LEFT JOIN cities ON cities.id = incidents.city_id LEFT JOIN states ON states.id = cities.state_id LEFT JOIN incidents_tags ON incidents_tags.incident_id = incidents.id LEFT JOIN tags ON tags.id = incidents_tags.tag_id").group("incidents.id").order("#{sort_column} #{sort_direction}")
    incidents = incidents.page(page).per_page(per_page)
    if params[:sSearch].present?
      incidents = incidents.where("users.name ilike :search or categories.name ilike :search or sub_categories.name ilike :search or cities.name ilike :search or states.name ilike :search or to_char(date, 'DD/MM/YYYY') like :search or tags.name ilike :search", search: "%#{params[:sSearch]}%")
    end
    incidents
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id users.name date cities.name states.name categories.name sub_categories.name tags verified]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end
