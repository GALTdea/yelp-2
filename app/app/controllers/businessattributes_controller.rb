class BusinessattributesController < ApplicationController
  # GET /businessattributes
  # GET /businessattributes.json
  def index
    @businessattributes = Businessattribute.limit(50)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businessattributes }
    end
  end

  # GET /businessattributes/1
  # GET /businessattributes/1.json
  def show
    @businessattribute = Businessattribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @businessattribute }
    end
  end

  # GET /businessattributes/new
  # GET /businessattributes/new.json
  def new
    @businessattribute = Businessattribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @businessattribute }
    end
  end

  # GET /businessattributes/1/edit
  def edit
    @businessattribute = Businessattribute.find(params[:id])
  end

  # POST /businessattributes
  # POST /businessattributes.json
  def create
    @businessattribute = Businessattribute.new(params[:businessattribute])

    respond_to do |format|
      if @businessattribute.save
        format.html { redirect_to @businessattribute, notice: 'Businessattribute was successfully created.' }
        format.json { render json: @businessattribute, status: :created, location: @businessattribute }
      else
        format.html { render action: "new" }
        format.json { render json: @businessattribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /businessattributes/1
  # PUT /businessattributes/1.json
  def update
    @businessattribute = Businessattribute.find(params[:id])

    respond_to do |format|
      if @businessattribute.update_attributes(params[:businessattribute])
        format.html { redirect_to @businessattribute, notice: 'Businessattribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @businessattribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businessattributes/1
  # DELETE /businessattributes/1.json
  def destroy
    @businessattribute = Businessattribute.find(params[:id])
    @businessattribute.destroy

    respond_to do |format|
      format.html { redirect_to businessattributes_url }
      format.json { head :no_content }
    end
  end
end
