class UsersController < ApplicationController

  before_action :check_if_logged_in, except: [:new, :create]

  # CREATE

  def new
    @user = User.new
  end

  def create
    # If passwords match, and name/e-mail are present then the new user will be saved to the database
    @user = User.create user_params

    # If a new user was created then they will be logged in
    if @user.persisted?
      session[:user_id] = @user.id

    # Need to redirect this somewhere else that hosts upcoming classes
      redirect_to user_profile_path

    else

      flash[:errors] = @user.errors.full_messages

      # ?render users#new page with partially completed form
      render :new
    end

  end # create

  # READ

  def index
    # this is only useful to display teacher profiles
  end

  def show
    @user = @current_user
  end


  #UPDATE
  def edit

    @user = User.find params[:id]

    unless @user == @current_user

      flash[:error] = 'You must be logged in to view this page'
      redirect_to login_path
      return

    end

  end


  def update
    @user = User.find params[:id]

    # ask luke if this is right
    # only update params if id to be updated matches the logged in user because it is possible to change where the form submits to in the console.
    unless @user == @current_user
      redirect_to login_path

      return #stop code below from executing
    end

    # redirect to "/user/:id" if update is successful
    if @user.update(user_params)
      redirect_to user_profile_path
    else
      flash[:errors] = @user.errors.full_messages

      render :edit
    end



  end

  # DELETE

  # probably needs a warning that the account will be permanently deleted
  def destroy
    User.find(@current_user.id).destroy
    session[:user_id] = nil #this logs out the user (deletes the session ID)
    redirect_to login_path



  end

  private

  # for security reasons - only the params below are permitted
  # does password confirmation actually need to be included
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

end
