# frozen_string_literal: true

# Helper module for sessions
module SessionsHelper
  def current_user
    @current_user = (User.find(session[:user_id]) if session[:user_id])
  end

  def authenticated?
    state = current_user.nil?
    if state
      session.delete(:user_id)
    end
    state
  end

  def admin?
    current_user.role.name == 'admin'
  end

  # rubocop:disable Style/GuardClause
  def authorize
    if authenticated?
      redirect_to login_url,
                  notice: 'you need to be authenticated for this action!'
    end
  end
  # rubocop:enable Style/GuardClause

  def authenticate(user)
    session[:user_id] = user.id
  end

  def log_out_user
    session[:user_id] = nil
    @current_user = nil
  end
end
