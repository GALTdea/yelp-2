class BusinessesController < ApplicationController

  def index
    #@businesses = Business.all
    @businesses = Business.limit(100)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businesses }
    end
  end

end
