require "open-uri"

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
    @employee.avatar.attach(io: URI.open(params[:employee][:avatar]), filename: "jean.jpg", content_type: "image/jpg")
    # @employee.avatar.attach(io: URI.open(), filename: "jean.jpg", content_type: "image/jpg")
    @employee.user = current_user
    if @employee.save
      redirect_to employee_path(@employee)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    puts "coucou"
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

  def myemployees
    @employees = Employee.where(user: current_user)
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :job_title, :description, :price_per_day)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

end
