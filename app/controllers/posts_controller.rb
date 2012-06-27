class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]
  # GET /posts
  # GET /posts.json
  #before_filter :require_user, :only => [:create, edit]
  #before_filter :require_admin, :only => [:destroy]
  def index
    @convo = Convo.find(params[:convo_id])
    @posts = @convo.posts.page(params[:page]).per_page(10)
    @post = Post.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @convo = Convo.find_by_id(params[:convo_id])
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @convo = Convo.find(params[:convo_id])
    @post = @convo.posts.new(:parent_id => params[:parent_id]) #=> dummy for form creation purposes
    @parent = @convo.posts.find_by_id(params[:parent_id]) #=> dummy for append purposes
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
      format.js
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @convo = Convo.find(params[:convo_id])
    @post = @convo.posts.new(params[:post])
    @post.merits = 0
    @post.user_id = current_user.id
    @parent = @convo.posts.find_by_id(params[:parent_id]) #=> would we @convo.post or just do Post; seems like we might as well save time going through the whole database again...

    respond_to do |format|
      if @post.save
        format.html { redirect_to convo_posts_url, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render json: @post.merits }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  def upmerit
    @post = Post.find(params[:id])
    demerituser(current_user,1)
    @post.update_attribute :merits, @post.merits + 1
    respond_to do |f|
      f.js
    end
  end
  
  def demerit
    @post = Post.find(params[:id])
    demerituser(current_user,2)
    @post.update_attribute :merits, @post.merits - 1
    respond_to do |f|
      f.js
    end
  end
  
end
