class ZattributesController < ApplicationController

  # GET /attributes
  # GET /attributes.json
  def index
    @zattributes = Zattribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @zattributes }
    end
  end

end
