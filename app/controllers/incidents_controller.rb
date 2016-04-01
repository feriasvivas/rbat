class IncidentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @incidents = Incident.all
  end

  def show
    @incident = Incident.find(params[:id])
  end

  def create
    @incident = Incident.new(incident_params)
    @incident.user_id = current_user.id
    tags2incident
    if @incident.save
      redirect_to incidents_path
    else
      render 'new'
    end
  end

  def new
    @states = State.all
    @categories = Category.all
    @chapters = Chapter.all
    @purposes = Purpose.all
    @occurrence_factors = OccurrenceFactor.all
    @states = State.all
    @property_usages = PropertyUsage.all
  end

  def edit
    @incident = Incident.find(params[:id])
    @states = State.all
    @categories = Category.all
    @chapters = Chapter.all
    @purposes = Purpose.all
    @occurrence_factors = OccurrenceFactor.all
    @property_usages = PropertyUsage.all
    @chapter = @incident.chapter_id
    @purpose = @incident.purpose_id
    @occurrence_factor = @incident.occurrence_factor_id
    @sub_category = @incident.sub_category_id
    @city = @incident.city_id
    @property_usage = @incident.property_usage_id
    @property_signaling = @incident.property_signaling
    @equipment_failure = @incident.equipment_failure
    @adequacy_to_norms = @incident.adequacy_to_norms
    @date = @incident.date.strftime("%d/%m/%Y")
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
    @incident = Incident.find(param[:id])
    @incident.destroy
    redirect_to incidents_path
  end

  def tags2incident
    formTags = params[:tags].split#.map{|e| e.strip!}
    @incident.tags.each do |t|
      unless formTags.include? t.name
        @incident.tags.delete(t)
      end
    end
    formTags.each do |t|
      tag = Tag.where(name: t)[0]
      tag = Tag.new(name: t) unless tag
      unless @incident.tags.include? tag
        @incident.tags << tag
      end
    end
  end

  private
  def incident_params
    params.require(:incident).permit!
  end
end
