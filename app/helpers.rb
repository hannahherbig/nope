Nope.helpers do
  def title(title = nil)
    if title
      @page_title = title
    else
      @page_title || "a twitter clone"
    end
  end

  def current_user
    @current_user ||= User[session[:user_id]] if session[:user_id]
  end

  def statuses
    if @statuses
      @statuses.eager(:user).order(:created_at.desc).all
    else
      Status.eager(:user).order(:created_at.desc).all
    end
  end

  def users
    if @users
      @users.order(:created_at.desc).all
    else
      User.order(:created_at.desc).all
    end
  end

  def need_login!
    flash[:error] = "You need to be logged in to do that."
    redirect url_for(:session, :new)
  end
end
