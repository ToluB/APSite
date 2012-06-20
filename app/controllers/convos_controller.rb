class ConvosController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]
  #before_filter :require_user, :only => [:create, edit]
  #before_filter :require_admin, :only => [:destroy]
  def index
    @subject = Subject.find_by_name(params[:subject_id])
    @convos = Convo.all # make this @convos=@subject.convos.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @convos }
    end
  end

  # GET /convos/1
  # GET /convos/1.json
  def show
    @convo = Convo.find(params[:id])
    @posts = @convo.posts
    @post = Post.new #=> dummy to allow immediate transition to new posts form
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
    @convo.merits = 0
    @convo.user_id = current_user.id
    respond_to do |format|
      if @convo.save
        format.html { redirect_to @convo, notice: 'New conversation created.' }
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
        format.html { redirect_to @convo, notice: 'Conversation has been modified.' }
        format.json { render json: @convo.merits }
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
