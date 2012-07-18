class ConvosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  #before_filter :require_admin, :only => [:destroy]
  def index
    if params[:query]
    @convos = Convo.text_search(params[:query]).page(params[:page]).per_page(3)
    elsif params[:subject_name]
      @subject = Subject.find_by_name(params[:subject_name])
      @convos = @subject.convos.page(params[:page]).per_page(5) 
      @popular = Convo.where(:created_at => (Time.now - 7.days)..Time.now ).order("merits DESC").page(params[:page]).per_page(10)
      #create a condition to select convos of the right subject ...
    else
    @convos = Convo.page(params[:page]).per_page(5)
    @popular = Convo.where(:created_at => (Time.now - 7.days)..Time.now ).order("merits DESC").page(params[:page]).per_page(3) 
        # @popular = Convo.where("created_at <?", (Time.now - 7.days)).order("merits DESC").page(params[:page]).per_page(3) 
  end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @convos }
      format.js
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

  # GET /convos/newrequire "convos_controller"
  
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
    @convo.user_id = current_user.id
    upmerituser(current_user, 10)
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
  def upmerit
    @convo = Convo.find(params[:id])
    if demerituser(current_user,1)
      @convo.update_attribute :merits, @convo.merits + 1
    end
    respond_to do |f|
      f.js
    end
  end
  
  def demerit
    @convo = Convo.find(params[:id])
    if demerituser(current_user,2)
      @convo.update_attribute :merits, @convo.merits - 1
    end
    respond_to do |f|
      f.js
    end
  end
end
