class ConvosController < ApplicationController
  # GET /convos
  # GET /convos.json
  def index
    @convos = Convo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @convos }
    end
  end

  # GET /convos/1
  # GET /convos/1.json
  def show
    @convo = Convo.find(params[:id])
    @post = Post.new()
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @convo }
    end
  end

  # GET /convos/new
  # GET /convos/new.json
  def new
    @convo = Convo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @convo }
    end
  end

  # GET /convos/1/edit
  def edit
    @convo = Convo.find(params[:id])
  end

  # POST /convos
  # POST /convos.json
  def create
    @convo = Convo.new(params[:convo])

    respond_to do |format|
      if @convo.save
        format.html { redirect_to @convo, notice: 'Convo was successfully created.' }
        format.json { render json: @convo, status: :created, location: @convo }
      else
        format.html { render action: "new" }
        format.json { render json: @convo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /convos/1
  # PUT /convos/1.json
  def update
    @convo = Convo.find(params[:id])

    respond_to do |format|
      if @convo.update_attributes(params[:convo])
        format.html { redirect_to @convo, notice: 'Convo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @convo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /convos/1
  # DELETE /convos/1.json
  def destroy
    @convo = Convo.find(params[:id])
    @convo.destroy

    respond_to do |format|
      format.html { redirect_to convos_url }
      format.json { head :no_content }
    end
  end
end
