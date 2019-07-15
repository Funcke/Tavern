module SessionsHelper
  def current_user
    if(session[:user_id])
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
  
  def authenticated?
    current_user.nil?
  end

  def authorize
    if authenticated?
      redirect_to login_url, notice: "you need to be authenticated for this action!"
    end
  end

  def authenticate(user)
    session[:user_id] =user.id
  end

  def log_out_user
    session[:user_id] = nil
    @current_user = nil
  end
end
