class BusinessesController < ApplicationController

  def index
  #  @cat = Businesscategory.where(:category_id => params[:categories])
#  formData.city = $('#input-city').val();
#  formData.categories = $('#input-category').val() || [];
#  formData.attributes = $('#input-attr').val() || [];
#  formData.reviewage = $('#input-review-age').val();
#  formData.minrating = $( "#input-rating" ).slider( "values", 0 );
#  formData.maxrating = $( "#input-rating" ).slider( "values", 1 );
    
    timeRange = (DateTime.now - 10.year)..(DateTime.now); 
    if(params[:reviewage] == "5y")
      timeRange = (DateTime.now - 5.year)..(DateTime.now); 
    elsif(params[:reviewage] == "2y")
      timeRange = (DateTime.now - 2.year)..(DateTime.now); 
    elsif(params[:reviewage] == "1y")
      timeRange = (DateTime.now - 1.year)..(DateTime.now); 
    elsif(params[:reviewage] == "6m")
      timeRange = (DateTime.now - 6.month)..(DateTime.now); 
    end

    @businesses = Business.where(:region => params[:city])


    if(params.has_key?(:attributes))
    #	@businesses = @businesses.joins(:businessattributes).where('businessattributes.attribute_id' => params[:attributes])
      
      @valid = Businessattribute.select(:business_id).where(:attribute_id => params[:attributes]).group(:business_id)
      .having("count(?)>=?", :business_id, params[:attributes].size)

      #@businesses = Business.where("ORACLEMASTER.BUSINESSES.business_id in ?", @valid)
      @businesses = @businesses.where(:business_id => @valid)
      
    end

   

    if(params.has_key?(:categories))
      @businesses = @businesses.joins(:businesscategories).where("businesscategories.category_id" => params[:categories])
    end

    @businesses = @businesses.select("ORACLEMASTER.BUSINESSES.business_id, avg(ORACLEMASTER.REVIEWS.stars) as rating, ORACLEMASTER.BUSINESSES.latitude, 
      ORACLEMASTER.BUSINESSES.longitude, ORACLEMASTER.BUSINESSES.name, ORACLEMASTER.BUSINESSES.full_address")
    .joins(:reviews).merge(
    Review.where(:review_date => timeRange))
    .group("ORACLEMASTER.BUSINESSES.business_id, ORACLEMASTER.BUSINESSES.latitude, ORACLEMASTER.BUSINESSES.longitude, ORACLEMASTER.BUSINESSES.name, ORACLEMASTER.BUSINESSES.full_address")
    .having("avg(ORACLEMASTER.REVIEWS.stars) >=" + params[:minrating] + "and avg(ORACLEMASTER.REVIEWS.stars) <=" + params[:maxrating] )


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businesses }
    end
  end

end