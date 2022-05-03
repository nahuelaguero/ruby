class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def edit
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = 'Department created succesfuly!'
      redirect_to @department
    else
      render 'new'
    end
  end

  def update
    if @department.update(department_params)
      flash[:notice] = 'Department updated!'
      redirect_to @department
    else
      render 'edit'
    end
  end

  def destroy
    @department.destroy
    redirect_to departments_path
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(
      :name,
      :organization_id
    )
  end
end
