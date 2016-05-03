class InstitutionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @institutions = Institution.all
  end

  def show
    @institution = Institution.find(params[:id])
  end

  def create
    @institution = Institution.new(institution_params)
    if @institution.save
      redirect_to institutions_path
    else
      render 'new'
    end
  end

  def edit
    @institution = Institution.find(params[:id])
  end

  def update
    @institution = Institution.find(params[:id])
    if @institution.update_attributes(institution_params)
      redirect_to institutions_path
    else
      render 'edit'
    end
  end

  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy
    redirect_to institutions_path
  end

  private
  def institution_params
    params.require(:institution).permit!
  end

end
