class ApplicationController < ActionController::Base

  before_action :fetch_user
  # run this method before every action of every controller

  def fetch_user

   if session[:user_id].present?

    @current_user = User.find_by id: session[:user_id]

   end

  # EDGE CASE - make sure we actually found a valid user (i.e. the user ID the session wasn't stale from a deleted account) and if we didn't get a valid user (in @current_user then we clear the session key)
    session[:user_id] = nil unless @current_user.present?

  end # fetch user



  def check_if_logged_in

    unless @current_user.present?
      # need to make sure ppl can only view their own page.

      flash[:error] = 'You must be logged in to view this page'
      redirect_to login_path

    end

  end

end
