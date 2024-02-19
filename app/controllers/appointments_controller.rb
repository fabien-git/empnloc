class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:destroy]

  def index
    @appointments = Appointment.where(user: current_user)
  end

  def new
    @employee = Employee.find(params[:id])
    @appointment = Appointment.new
  end


  def create
    @employee = Employee.find(params[:employee_id])
    @appointment = Appointment.new
    @appointment.total_price = params[:price]
    @appointment.user = current_user
    @appointment.renting_days = 1
    @appointment.employee = @employee
    # @appointment.save!
    if @appointment.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  def destroy
    if @appointment.destroy
      redirect_to employees_path(@appointment.employee), status: :see_other
    else
      render :index, status: :unprocessable_entity
    end
  end


  def historic

  end

private

  def appointments_params
    params.require(:appointment).permit(:total_price, :renting_days)
  end

  def set_appointment
    @appointment = appointment.find(params[:id])
  end
end
