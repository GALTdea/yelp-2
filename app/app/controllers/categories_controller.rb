class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.limit(50)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end
end
