class SubjectsController < ApplicationController
  def index
    #only admin will be able to see subjects#index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:subject_id])
    @convos = @subject.convos 
  end
end
