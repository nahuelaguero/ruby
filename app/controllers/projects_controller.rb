class ProjectsController < ApplicationController
  
  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create 
    @project = Project.new(params
      .require(:project)
      .permit(
        :name,
        :organization,
        :status,
        :supervisor,
        :people,
        :description,
        :start_date,
        :end_date
      ))
    if @project.save
      flash[:notice] = 'Project created succesfuly!'
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(params
      .require(:project)
      .permit(
        :name,
        :organization,
        :status,
        :supervisor,
        :people,
        :description,
        :start_date,
        :end_date
      ))
      flash[:notice] = "Project updated!"
      redirect_to @project
    else
      render 'edit'
    end
  end
end
