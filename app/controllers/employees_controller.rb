class EmployeesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_employee, only: [:edit, :update, :destroy]

  def index
    @employees = Employee.all
    @top_employees = @employees[0,3]
  end

  def show
    @employee = Employee.find(params[:id])
    @appointment = Appointment.new
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.user = current_user
    if @employee.save
      redirect_to employee_path(@employee)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_path(@employee)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @employee.destroy
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :job_title, :price_per_day)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

end
