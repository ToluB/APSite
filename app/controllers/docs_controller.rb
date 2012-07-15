class DocsController < ApplicationController
  before_filter :load_docable
  def index
    @docs = @docable.docs

  end

  def show
    @doc = Doc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @doc }
    end
  end

  # GET /docs/new
  # GET /docs/new.json
  def new
    @doc = @docable.docs.new

    # respond_to do |format|
    #      format.html # new.html.erb
    #      format.json { render json: @doc }
    #    end
  end

  # GET /docs/1/edit
  def edit
    @doc = Doc.find(params[:id])
  end

  # POST /docs
  # POST /docs.json
  def create
    @doc = @docable.docs.new(params[:doc])
    @doc.user_id = current_user.id
    

    respond_to do |format|
      if @doc.save
        redirect_to [@docable, :docs], notice: "Document saved"
      else
       render :new, notice: "Error. Could not save document"
  
      end
    end
  end

  # PUT /docs/1
  # PUT /docs/1.json
  def update
    @doc = Doc.find(params[:id])

    respond_to do |format|
      if @doc.update_attributes(params[:doc])
        format.html { redirect_to @doc, notice: 'Doc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/1
  # DELETE /docs/1.json
  def destroy
    @doc = Doc.find(params[:id])
    @doc.destroy

    respond_to do |format|
      format.html { redirect_to docs_url }
      format.json { head :no_content }
    end
  end
  
  def load_docable
    @docable = if params[:convo_id]
      Convo.find(params[:convo_id])
    elsif params[:post_id]
      Post.find(params[:photo_id])
    end
  end
end
