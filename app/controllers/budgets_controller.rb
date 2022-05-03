class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
  end

  def edit
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      flash[:notice] = 'budget created succesfuly!'
      redirect_to @budget
    else
      render 'new'
    end
  end

  def update
    if @budget.update(budget_params)
      flash[:notice] = 'budget updated!'
      redirect_to @budget
    else
      render 'edit'
    end
  end

  def destroy
    @budget.destroy
    redirect_to budgets_path
  end

  private

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(
      :amount,
      :organization_id
    )
  end
end
