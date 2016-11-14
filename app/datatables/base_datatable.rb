class BaseDatatable
  delegate :params, :link_to, to: :@view

  def initialize(view, controller, all_items)
    @view = view
    @controller = controller
    @all_items = all_items
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: @all_items.count,
      iTotalDisplayRecords: items.total_entries,
      aaData: data
    }
  end

private

  def items
    @items ||= fetch_items
  end

  def fetch_items
    items = joins(@all_items).order("#{sort_column} #{sort_direction}").page(page).per_page(per_page)
    if params[:sSearch].present?
      items = items.where(search_string, search: "%#{params[:sSearch]}%")
    end
    items
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end
