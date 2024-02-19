class AppointmentsController < ApplicationController
  before_action :set_appointement, only: [:destroy]

  def index
    @appointements = Appointement.all
  end


  def new
    @employee = Employee.find(params[:id])
    @appointement = Appointement.new
  end


  def create
    @employee = Employee.find(params[:id])
    @appointement = Appointement.new(appointements_params)
    appointement.employee = @employee
    if @appointement.save
      redirect_to appointement_path(@appointement)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    if @appointement.destroy
      redirect_to employees_path(@appointement.employee), status: :see_other
    else
      render :index, status: :unprocessable_entity
    end
  end

private

  def appointements_params
    params.require(:appointement).permit(:total_price, :renting_days)
  end

  def set_appointement
    @appointement = Appointement.find(params[:id])
  end
end
