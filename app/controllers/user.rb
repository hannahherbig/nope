Nope.controllers :user do
  get :new do
    title "Sign up"
    render "user/new"
  end

  post :create do
    title "Sign up"
    u = params[:user]
    user = User.register(u[:username], u[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Signed up!"
      redirect url_for(:index)
    else
      flash[:error] = "Someone already has that name!"
      redirect url_for(:user, :new)
    end
  end

  get :list do
    title "Users"
    render "user/list"
  end

  get :index, :with => :username do
    title "User timeline"
    user = User[:username => params[:username]]
    if user
      @statuses = Status.where(:user => user)
      render "status/list"
    else
      error 404
    end
  end
end
