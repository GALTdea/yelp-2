class RegionsController < ApplicationController

  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @regions }
    end
  end

end
