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
  end

  def edit
    @incident = Incident.find(params[:id])
    @states = State.all
    @categories = Category.all
    @chapters = Chapter.all
    @purposes = Purpose.all
    @occurrence_factors = OccurrenceFactor.all
  end

  def update
    @incident = Incident.find(params[:id])
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

  private
  def incident_params
    params.require(:incident).permit!
  end
end
