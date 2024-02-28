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
    @appointment = Appointment.new(appointments_params)
    @appointment.user = current_user
    @appointment.employee = @employee
    @appointment.save!
    if @appointment.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
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
     @appointments = Appointment.where(user: current_user)
  end

private

  def appointments_params
    params.require(:appointment).permit(:total_price, :renting_days,  :debut_de_reservation, :fin_de_reservation)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
