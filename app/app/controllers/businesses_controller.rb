class BusinessesController < ApplicationController

  def index
    #@businesses = Business.all
  
    @city = params[:city].gsub('_', ' ')

    @b = Business.where(:city = @city).limit(100)

    @businesses = @b.each {|x| x['rating'] = 1}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businesses }
    end
  end

end
