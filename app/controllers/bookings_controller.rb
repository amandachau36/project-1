class BookingsController < ApplicationController

  before_action :check_if_logged_in

  # Create
  def new
  end

  def create
    u = @current_user.id
    d = DateTime.strptime(params[:date], '%s')
    s = params[:id]

    e = Enrollment.find_by user_id: u, date: d, schedule_id: s

    # avoid duplication
    unless e.present?

      @enrollment = Enrollment.create(
        user_id: u,
        date: d,
        schedule_id: s
      )

    end

    # avoid duplicates
    # @current_user.classes_attending << s unless @current_user.classes_attending.include? s

    redirect_to bookings_path

  end

  # read
  def index
  end

  def show

    #if student, show class enrollments/bookings
    @enrollments = @current_user.enrollments.sort_by {
      |enrollment| enrollment['date']
    }

    # @booking = @current_user.classes_attending
    # User.second.enrollments.first.schedule.title

    # if instructor show classes that they are teaching
    @classes_teaching = @current_user.classes_teaching


  end

  def details
    @date = DateTime.strptime(params[:date], '%s')
    s = params[:id]

    @enrollments = Enrollment.where date: @date, schedule_id: s
    @schedule = Schedule.find s
    # raise 'hell'

  end

  # update
  def edit

  end

  def update
  end

  # delete
  def destroy



    user_id = @current_user.id
    date = DateTime.strptime(params[:date], '%s')
    schedule_id = params[:id]

    e = Enrollment.find_by user_id: user_id, date: date, schedule_id: schedule_id

    if e.present?
      e.destroy
    end



    # user = @current_user
    # booking = Schedule.find params[:id]
    #
    # user.classes_attending.delete(booking)

    redirect_to bookings_path

  end


end
