class IncidentsDatatable < BaseDatatable
  def columns
    %w[id users.name date cities.name states.name categories.name sub_categories.name tags verified]
  end

  def search_string
    "users.name ilike :search or categories.name ilike :search or sub_categories.name ilike :search or cities.name ilike :search or states.name ilike :search or to_char(date, 'DD/MM/YYYY') like :search or tags.name ilike :search"
  end

  def joins(items)
    items.joins("LEFT JOIN users ON incidents.user_id = users.id LEFT JOIN sub_categories ON incidents.sub_category_id = sub_categories.id LEFT JOIN categories ON categories.id = sub_categories.category_id LEFT JOIN cities ON cities.id = incidents.city_id LEFT JOIN states ON states.id = cities.state_id LEFT JOIN incidents_tags ON incidents_tags.incident_id = incidents.id LEFT JOIN tags ON tags.id = incidents_tags.tag_id").group("users.name, categories.name, sub_categories.name, cities.name, states.name, incidents.id")
  end

  def data
    items.map do |incident|
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

end
