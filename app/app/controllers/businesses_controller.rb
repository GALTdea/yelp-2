class BusinessesController < ApplicationController

  def index
  #  @cat = Businesscategory.where(:category_id => params[:categories])

    @businesses = Business.where(:city => params[:city])

    if(params.has_key?(:categories))
    	@businesses = @businesses.joins(:businesscategories).where('businesscategories.category_id' => params[:categories])
    end
    if(params.has_key?(:atributes))
    	@businesses = @businesses.joins(:businessattributes).where('businessattributes.attribute_id' => params[:attributes])
    end

   # Business.joins(:categories)

  # @businesses = @b.each {|x| x[:rating] = 1}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businesses }
    end
  end

end
