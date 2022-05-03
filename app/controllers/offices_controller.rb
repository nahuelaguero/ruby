class OfficesController < ApplicationController
  before_action :set_office, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @offices = Office.all
  end

  def new
    @office = Office.new
  end

  def edit
  end

  def create
    @office = Office.new(office_params)
    if @office.save
      flash[:notice] = 'Office created succesfuly!'
      redirect_to @office
    else
      render 'new'
    end
  end

  def update
    if @office.update(office_params)
      flash[:notice] = 'office updated!'
      redirect_to @office
    else
      render 'edit'
    end
  end

  def destroy
    @office.destroy
    redirect_to offices_path
  end

  private

  def set_office
    @office = Office.find(params[:id])
  end

  def office_params
    params.require(:office).permit(
      :name,
      :organization_id
    )
  end
end
