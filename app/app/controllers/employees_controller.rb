class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:employee])
  end

  def edit
    @employee = Employee.find(params[:employee])
  end
  
  def update
    @object = Employee.find(employee_params)
      if @object.update_attributes(params[:employee])
        flash[:success] = "Object was successfully updated"
        redirect_to @object
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Object.new(employee_params)
    if @employee.save
      flash[:success] = "Object successfully created"
      redirect_to @employee
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @employee = Object.find(params[:id])
    if @employee.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to objects_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to objects_url
    end
  end
  
  
  private
  def employee_params
    params.require(:employee).permit(:name, :email, :position, :id_employee, :private_number, :store)
  end
end