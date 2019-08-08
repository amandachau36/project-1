class BookingsController < ApplicationController

  before_action :check_if_logged_in

  # CREATE

  # this enables students to book classes
  def create
    user_id = @current_user.id
    date = DateTime.strptime(params[:date], '%s')
    schedule_id = params[:id]

    e = Enrollment.find_by user_id: user_id, date: date, schedule_id: schedule_id

    # avoid duplicating enrollments
    unless e.present?

      @enrollment = Enrollment.create(
        user_id: user_id,
        date: date,
        schedule_id: schedule_id
      )

    end

    redirect_to bookings_path

  end

  # READ

  # homepage/"My classes" view
  def show

    #if student, show class enrollments/bookings
    @enrollments = @current_user.enrollments.sort_by {
      |enrollment| enrollment['date']
    }

    # if instructor show classes that they are teaching
    @classes_teaching = @current_user.classes_teaching


  end

# show number of students, and student names/emails for each class.
  def details
    s = params[:id]
    @schedule = Schedule.find s

    #Restricts access to class details to the instructor who created the class. Front-end restrictions also in place.
    unless @current_user == @schedule.instructor
      redirect_to schedule_path(s)
      return
    end

    @date = DateTime.strptime(params[:date], '%s')

    @enrollments = Enrollment.where date: @date, schedule_id: s

  end # end of details

  # UPDATE


  # DELETE
  def destroy

    u = @current_user.id
    d = DateTime.strptime(params[:date], '%s')
    s = params[:id]

    e = Enrollment.find_by user_id: u, date: d, schedule_id: s

    if e.present?
      e.destroy
    end

    redirect_to bookings_path

  end


end


# def destroy - use method below if only using a join table and not a join table that is also a model
# user = @current_user
# booking = Schedule.find params[:id]
# user.classes_attending.delete(booking)
