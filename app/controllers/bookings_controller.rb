class BookingsController < ApplicationController

  before_action :check_if_logged_in

  # Create
  def new
  end

  def create

  s = Schedule.find params[:id]

  # avoid duplicates
  @current_user.schedules << s unless @current_user.schedules.include? s

  redirect_to bookings_path

  end

  # read
  def index
  end

  def show
    @bookings = @current_user.schedules
  end

  # update
  def edit

  end

  def update
  end

  # delete
  def delete
    # user = User.find(params[:id])
    # booking = Schedule.find
    # # how do I pass in booking id aboveee
    # user.schedules.delete(booking)
    #
    # redirect_to booking_path(params[:id])

  end
end
