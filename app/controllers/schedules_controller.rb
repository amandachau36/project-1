class SchedulesController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show]

  # CREATE
  def new
    @schedule = Schedule.new
  end

  def create

    @schedule = Schedule.new schedule_params

    # saves current user as instructor
    @schedule.user_id = @current_user.id

    if params[:file].present?
      req = Cloudinary::Uploader.upload( params[:file] )
      #req is a hash
      @schedule.image = req["public_id"]
    end

    # only instructors are allowed to create yoga classes. Also restricted from the front-end
    if @schedule.instructor.is_instructor
      @schedule.save
    end

    # this submits to /schedules method: 'post'
    # MUST have :title, :start (in the future), :duration
    if @schedule.persisted?
      redirect_to schedules_path, method: 'post'

    else
      flash[:errors] = @schedule.errors.full_messages

      render :new
    end

  end

  # READ
  def index
    # all classes in chronological order
    # Check with luke - loops through each array item (i.e. schedule) and sorts in ascending order depending on the value of the start key/hash?
    @schedules = Schedule.all.sort_by { |schedule| schedule['start']
    }
  end

  def show
    @schedule = Schedule.find params[:id]
    # this generates dates for each yoga class. Each yoga class may have 0 repeats (i.e. an one off event) or multiple classes repeating at weekly intervals
    @repeats_array = []

    # times loop is preferred in Ruby (instead of while loop)
    (@schedule.number_of_repeats+1).times do |i|
      @repeats_array.push(@schedule.start+(i).weeks)
    end

  end

  #UPDATE
  def edit
    @schedule = Schedule.find params[:id]

    # Edit rights restricted to the instructor who created the class
    unless @schedule.instructor == @current_user
      redirect_to schedule_path(params[:id])
      return
    end

  end

  def update
    @schedule = Schedule.find params[:id]

    # Edit rights restricted to the instructor who created the class
    unless @schedule.instructor == @current_user
      redirect_to schedule_path(params[:id])
      return
    end

    if params[:file].present?
      req = Cloudinary::Uploader.upload( params[:file] )
      #req is a hash
      @schedule.image = req["public_id"]
    end


    if @schedule.update(schedule_params)
      redirect_to schedule_path(params[:id])
    else
      flash[:errors] = @schedule.errors.full_messages

      render :edit
    end

  end #end of update

  #DELETE
  def destroy
    s = Schedule.find params[:id]
    s.destroy
    redirect_to schedules_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :duration, :level, :description, :start, :number_of_repeats, :address)
    # do not include :image this is being submitted cloudinary prior to including the params above
  end

end
