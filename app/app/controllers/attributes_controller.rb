class AttributesController < ApplicationController
  # GET /attributes
  # GET /attributes.json
  def index
    @attributes = Attribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attributes }
    end
  end
end
