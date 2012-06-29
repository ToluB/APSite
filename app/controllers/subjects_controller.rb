class SubjectsController < ApplicationController
  def index
    #only admin will be able to see subjects#index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find_by_name(params[:name])
    @subject = Subject.find(@subject.id)
    @convos = @subject.convos 
  end
  
  def new
    @subject = Subject.new()
  end
  
  def create
    subject = Subject.create(params[:subject])
    subject.save
    redirect_to subjects_path
  end
  
  def destroy
    subject = Subject.find_by_id(params[:id])
    subject.destroy
  end
  
  def edit
    @subject = Subject.find_by_id(params[:id])
  end
  
  def update
    subject = Subject.find(params[:id])
    subject.update_attributes(params[:subject])
  end
  
end
