class BusinesscategoriesController < ApplicationController
  # GET /businesscategories
  # GET /businesscategories.json
  def index
    @businesscategories = Businesscategory.limit(50)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businesscategories }
    end
  end

end
