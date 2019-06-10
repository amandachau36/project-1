class SchedulesController < ApplicationController
  # CREATE
  def new
  end

  def create
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
end
