class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = 'Project created succesfuly!'
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Project updated!'
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(
      :name,
      :organization_id,
      :budget_id,
      :department_ids[],
      :office_ids[],
      :status,
      :supervisor,
      :person_id,
      :description,
      :start_date,
      :end_date
    )
  end
end
