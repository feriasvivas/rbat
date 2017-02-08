class IncidentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :xlsx, :html, :json

  def index
    case current_user.roles
    when 1
      @incidents = Incident.all
    when 2
      user_ids = User.where(supervisor_id: current_user.id).map{ |e| e.id }
      user_ids.insert(0, current_user.id)
      @incidents = Incident.where(user_id: user_ids)
    else
      @incidents = Incident.where(user_id: current_user.id)
    end

    respond_to do |format|
      format.html
      format.xlsx { render xlsx: :index, filename: "rbat_incidents" }
      format.json { render json: IncidentsDatatable.new(view_context, self, @incidents) }
    end
  end

  def search
    @states = State.all
  end

  def filter
    @date = params[:incident][:date] unless params[:incident][:date].empty?
    @state = params[:state] unless params[:state].empty?
    @city = params[:incident][:city_id] if params[:incident][:city_id] && !params[:incident][:city_id].empty?
    @states = State.all
    @cities = City.where(state_id: @state)

    if @date
      if Date.valid_date? *@date.split('/').reverse.map(&:to_i)
        if @city
          @incidents = Incident.where(city: @city, date: DateTime.strptime(@date, '%d/%m/%Y'))
        elsif @state
          @incidents = Incident.where(date: DateTime.strptime(@date, '%d/%m/%Y'), city: @cities)
        else
          @incidents = Incident.where(date: DateTime.strptime(@date, '%d/%m/%Y'))
        end
      else
        flash[:warning] = "Data inválida."
        render 'search'
        return
      end
    elsif @city
      @incidents = Incident.where(city: @city)
    elsif @state
      @incidents = Incident.where(city: @cities)
    else
      flash[:warning] = "Nenhum filtro foi definido."
      render 'search'
      return
    end



    if @incidents.empty?
      lists4selects
      render 'new'
    else
      render 'search'
    end
  end

  def show
    @incident = Incident.find(params[:id])
  end

  def create
    @incident = Incident.new(incident_params)
    @incident.user_id = current_user.id
    tags2incident
    if @incident.save
      redirect_to incident_path(@incident)
    else
      lists4selects
      puts @incident.errors.full_messages.to_sentence
      flash[:warning] = @incident.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def new
    lists4selects
  end

  def edit
    @incident = Incident.find(params[:id])
    @states = State.all
    @categories = Category.all
    @chapters = Chapter.all
    @occurrence_factors = OccurrenceFactor.all
    @property_usages = PropertyUsage.all
    @chapter = @incident.chapter_id
    @occurrence_factor = @incident.occurrence_factor_id
    @sub_category = @incident.sub_category_id
    @city = @incident.city_id
    @property_usage = @incident.property_usage_id
    @property_signaling = @incident.property_signaling
    @equipment_failure = @incident.equipment_failure
    @adequacy_to_norms = @incident.adequacy_to_norms
    @date = @incident.date.strftime("%d/%m/%Y") if @incident.date
    @tags = @incident.tags2string
    if @incident.city
      @state = @incident.city.state_id
      @cities = City.where(state_id: @state)
    end
  end

  def update
    @incident = Incident.find(params[:id])
    tags2incident
    if @incident.update_attributes(incident_params)
      redirect_to incident_path(@incident)
    else
      lists4selects
      puts @incident.errors.full_messages.to_sentence
      flash[:warning] = @incident.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @incident = Incident.find(params[:id])
    @incident.destroy
    redirect_to incidents_path
  end

  def tags2incident
    formTags = params[:tags].split(';').map{|e| e.strip}
    @incident.tags.each do |t|
      unless formTags.include? t.name
        @incident.tags.delete(t)
      end
    end
    formTags.each do |t|
      unless t.empty?
        tag = Tag.where(name: t)[0]
        tag = Tag.new(name: t) unless tag
        unless @incident.tags.include? tag
          @incident.tags << tag
        end
      end
    end
  end

  private
  def incident_params
    params.require(:incident).permit!
  end

  def lists4selects
    @states = State.all
    @categories = Category.all
    @chapters = Chapter.all
    @purposes = Purpose.all
    @occurrence_factors = OccurrenceFactor.all
    @states = State.all
    @property_usages = PropertyUsage.all
  end

  def fetch_incidents
    incidents = Incident.order("#{sort_column} #{sort_direction}")
    incidents = incidents.page(page).per_page(per_page)
    if params[:sSearch].present?
      incidents = incidents.where("user.name like :search or category like :search", search: "%#{params[:sSearch]}%")
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
    columns = %w[id user.name date city.name state.name category.name sub_category.name tags verified]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

  def conditions
    conditions = []
    conditions << "(incidents.user.name ILIKE '%#{params[:sSearch]}%' OR incidents.city.name ILIKE '%#{params[:sSearch]}%')" if(params[:sSearch])
    return conditions.join(" AND ")
  end

end
