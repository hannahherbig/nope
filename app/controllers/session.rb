Nope.controllers :session do
  get :new do
    title "Log in"
    render "session/new"
  end

  post :create do
    title "Log in"
    u = params[:user]
    @user = User.authenticate(u[:username], u[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Logged in!"
      redirect url_for(:index)
    else
      flash.now[:error] = "Invalid username or password"
      render "session/new"
    end
  end

  get :destroy do
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect url_for(:index)
  end
end
