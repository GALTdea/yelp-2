class BusinesscategoriesController < ApplicationController

  # GET /businesscategories
  # GET /businesscategories.json
  def index
    @businesscategories = Businesscategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businesscategories }
    end
  end

end
