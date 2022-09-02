class CompanyBranchesController < ApplicationController
  def index
    @stores = Store.all
  end
  def show
    @store = Store.find(params[:id])
  end
  def new
    @store = Store.new()
  end
  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to company_branch_path(@store)
    else 
      render :new, status: :unproccessable_entity
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])

    if @store.update(store_params)
      redirect_to company_branch_path(@store)
    else
      render :edit, status: :unprocessable_entity
    end
  end

    def destroy
      @store = Store.find(params[:id])
      @store.destroy
      redirect_to company_branches_path, status: :see_other
    end

  private
    def store_params
      params.require(:store).permit(:name, :address)
    end
end