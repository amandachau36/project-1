class SessionController < ApplicationController
  def new
  end

  def create

    user = User.find_by email: params[:email]

    # can only log in if e-mail is in table and password is correct
    if user.present? && user.authenticate( params[:password] )

    # session data is remembered across page requests (But must set before_fetch in application controller)
    session[:user_id] = user.id

    # Redirects to user's profile page
    redirect_to user_path(user.id)

    else

    # flash[:errors] = user.errors.full_messages
    # Cannot use above, it works on regular create routes but not in sessions because we are not actually creating something new.
    flash[:error] = "Invalid email or password. Try again."

    redirect_to login_path

    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
