class IncidentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :xlsx, :html

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
      format.html {@incidents = @incidents.page(params[:page])}
      format.xlsx { render xlsx: :index, filename: "rbat_incidents" }
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
    @tags = @incident.tags
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
end
