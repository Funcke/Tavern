# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :authorize, only: [:destroy]
  def new; end

  def create
    user = User.find_by_email(params[:email])
    if !user.nil? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'logged in!'
    else
      redirect_to new_session_path, notice: user.nil? ? 'User not found' : 'Password not correct!'
    end
  end

  def destroy
    log_out_user
    redirect_to root_url, notice: 'logged out!'
  end
end
