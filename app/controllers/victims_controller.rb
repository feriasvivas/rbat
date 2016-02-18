class VictimsController < ApplicationController
  before_action :authenticate_user!
  before_filter :incident_exists, :only => [:new, :create]

  protected
	def incident_exists
		unless (@incident = Incident.find_by_id(params[:incident_id]))
			redirect_to incidentss_path
		end
	end

	public
	def new
    fillLists
		@victim = @incident.victims.build
	end

	def create
		@incident.victims.create(victim_params)
		redirect_to incident_path(@incident)
	end

	def edit
    fillLists
		@victim = Victim.find params[:id]
    @gender = @victim.gender
    @experience = @victim.experience_id
    @severity = @victim.severity_id
		@incident = @victim.incident
    @effect_alcohol = @victim.effect_alcohol
    @effect_drugs = @victim.effect_drugs
    @physically_challenged = @victim.physically_challenged
	end

	def update
		@victim = Victim.find params[:id]
		if @victim.update_attributes(victim_params)
		  redirect_to incident_path(@victim.incident)
		else
		  render 'edit'
		end
	end

  def fillLists
    @experiences = Experience.all
    @severities = Severity.all
  end

	private
	def victim_params
		params.require(:victim).permit!
	end
end
