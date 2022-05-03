class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @organization = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      flash[:notice] = 'Organization created succesfuly!'
      redirect_to @organization
    else
      render 'new'
    end
  end

  def update
    if @organization.update(organization_params)
      flash[:notice] = 'Organization updated!'
      redirect_to @organization
    else
      render 'edit'
    end
  end

  def destroy
    @organization.destroy
    redirect_to Organizations_path
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end
end
