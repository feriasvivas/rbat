class SourcesController < ApplicationController
  before_action :authenticate_user!
  before_filter :incident_exists, :only => [:new, :create]

  protected
  def incident_exists
		unless (@incident = Incident.find_by_id(params[:incident_id]))
			redirect_to sources_path
		end
	end

	public
	def new
    @source = @incident.sources.build
  end

  def create
    @incident.sources.create(source_params)
    redirect_to incident_path(@incident)
  end

  def edit
    @source = Source.find params[:id]
  end

  def update
    @source = Source.find params[:id]
    if @source.update(source_params)
      redirect_to incident_path(@source.incident)
    else
      render 'edit'
    end
  end

  def destroy
    @source = Source.find params[:id]
    @source.delete
    redirect_to indicent_path(params[:indicent_id])
  end

  private
  def source_params
    params.require(:source).permit!
  end
end
