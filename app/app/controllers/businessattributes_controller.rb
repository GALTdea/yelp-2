class BusinessattributesController < ApplicationController

  # GET /businessattributes.json
  def index
    @businessattributes = Businessattribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businessattributes }
    end
  end

end
