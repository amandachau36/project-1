class SchedulesController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show]

  # CREATE
  def new
    @schedule = Schedule.new
  end

  def create

    @schedule = Schedule.new schedule_params

    # p @schedule

    @schedule.instructor = @current_user.name

    @schedule.save 

    # this submits to /schedules method: 'post'

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
  end

  def update
  end

  #DELETE
  def destroy
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :image, :duration, :level, :description, :start)
  end

end
