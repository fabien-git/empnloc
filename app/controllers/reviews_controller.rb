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
      @employee.rating = average_rating
      redirect_to employee_path(@employee)
    else
      @review.save!
    end

  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def average_rating
    reviews_employee = Review.where(employee: @employee)
    count = 0
    reviews_employee.each do |review|
      count += review.rating
    end
    count / reviews_employee.size
  end
end
