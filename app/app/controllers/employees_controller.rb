class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end
  def show
    @employee = Employee.find(params[:employee])
  end
  def update
    @object = Object.find(params[:id])
      if @object.update_attributes(params[:object])
        flash[:success] = "Object was successfully updated"
        redirect_to @object
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  def create
    @object = Object.new(params[:object])
    if @object.save
      flash[:success] = "Object successfully created"
      redirect_to @object
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  private
  def employee_params
    params.require(:employee).permit(:name, :address)
  end
end