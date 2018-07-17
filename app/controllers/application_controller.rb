class ApplicationController < ActionController::Base
  helper_method :current_user, :set_ph

  def home
    if logged_in?
      @posts = Post.all.limit(10)
      if admin?
        @p_teas = PendingTea.all
        @users = User.all
        @teas = Tea.all
        render :admin
      else
        @p_teas = PendingTea.all
        @users = User.all
        render :home
      end
    else
      render :welcome
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def owner?(obj)
    logged_in? && obj.user_id == current_user.id
  end

  def require_login
      return head(:forbidden) unless session.include? :user_id
  end

  def set_ph(attr, obj)
    if obj.nil?
      attr.capitalize
    else
      "#{attr.capitalize} #{obj.errors[:"#{attr}"].first}" || attr.capitalize
    end
  end

  def admin?
    logged_in? && current_user.admin == true
  end

  def lo_director
    if !logged_in?
      render :welcome
    end
  end

  def li_director
    if logged_in?
      redirect_to root_path
    end
  end

end
