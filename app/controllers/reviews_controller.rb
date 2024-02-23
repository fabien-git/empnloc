class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @employee = Employee.find(params[:employee_id])
    @Review = Review.new
  end

  def create

    @employee = Employee.find(params[:employee_id])
    @review = Review.new(review_params)
    @review.employee = @employee
    if @review.save
      redirect_to employee_path(@employee)
  else
    puts"----------------------------"
    @review.save!
  end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
