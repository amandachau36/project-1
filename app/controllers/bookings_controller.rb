class BookingsController < ApplicationController

  before_action :check_if_logged_in

  # Create
  def new
  end

  def create

  s = Schedule.find params[:id]

  # avoid duplicates
  @current_user.classes_attending << s unless @current_user.classes_attending.include? s

  redirect_to bookings_path

  end

  # read
  def index
  end

  def show
    @bookings = @current_user.classes_attending
  end

  # update
  def edit

  end

  def update
  end

  # delete
  def destroy
    user = @current_user
    booking = Schedule.find params[:id]

    user.classes_attending.delete(booking)

    redirect_to bookings_path

  end
end
