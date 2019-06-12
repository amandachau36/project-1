class SchedulesController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show]

  # CREATE
  def new
    @schedule = Schedule.new
  end

  def create

    @schedule = Schedule.new schedule_params

    # p @schedule

    @schedule.user_id = @current_user.id

    if params[:file].present?
      req = Cloudinary::Uploader.upload( params[:file] )
      #req is a hash
      @schedule.image = req["public_id"]
    end

    if @schedule.instructor.is_instructor 
      @schedule.save
    end


    # this submits to /schedules method: 'post', is this correct???
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
    # Check with luke - loops through each array item (i.e. schedule) and sorts in ascending order depending on the value of the start key/hash
    @schedules = Schedule.all.sort_by { |schedule| schedule['start'] }
  end

  def show
    @schedule = Schedule.find params[:id]

  end

  #UPDATE
  def edit
    @schedule = Schedule.find params[:id]

    unless @schedule.instructor == @current_user
      redirect_to schedule_path(params[:id])
      return
    end

  end

  def update
    @schedule = Schedule.find params[:id]

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
    params.require(:schedule).permit(:title, :duration, :level, :description, :start)
  end

end
