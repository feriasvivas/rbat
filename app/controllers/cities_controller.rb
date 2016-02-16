class CitiesController < ApplicationController

def index
  @cities = City.where(state_id: params[:id])
  if request.xhr?
    render :partial => 'cities_select', :object => @cities 
  end
end

end
