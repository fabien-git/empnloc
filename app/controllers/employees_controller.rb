require "open-uri"

class EmployeesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_employee, only: [:edit, :update, :destroy]

  def index
    @employees = Employee.all
    @top_employees = @employees[0,3]
    if params[:query].present?
      sql_query = "job_title ILIKE :query OR description ILIKE :query OR first_name ILIKE :query OR last_name ILIKE :query"
      @employees = Employee.where(sql_query, query: "%#{params[:query]}%")
    else
      @employees = Employee.all
    end
  end

  def show

    @employee = Employee.find(params[:id])
    @appointment = Appointment.new
    @reviews = Review.where(employee: params[:id])
    @review = Review.new
    total_rating = 0
    if @reviews.present?
      @reviews.each do |review|
      total_rating += review.rating
    end
    @average_rating = (total_rating / @reviews.count).round
  end


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
    @employee.avatar.attach(io: URI.open(params[:employee][:avatar]), filename: "jean.jpg", content_type: "image/jpg")
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
