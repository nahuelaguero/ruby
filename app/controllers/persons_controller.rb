class PersonsController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @persons = Person.all
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      flash[:notice] = 'Person created succesfuly!'
      redirect_to @person
    else
      render 'new'
    end
  end

  def update
    if @person.update(person_params)
      flash[:notice] = 'Person updated!'
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    @person.destroy
    redirect_to persons_path
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(
      :name,
      :last_name,
      :supervisor
    )
  end
end
