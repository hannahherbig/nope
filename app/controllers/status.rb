Nope.controllers :status do
  get :new do
    title "New status"
    render "status/new"
  end

  post :create do
    title "New status"
    if current_user
      if current_user.post_status(params[:status][:text])
        flash[:notice] = "Status posted!"
        redirect url_for(:index)
      end
    else
      flash[:error] = "You need to be logged in to do that."
      render "session/new"
    end
  end

  get :list do
    title "Users"
    render "user/list"
  end

  get :index, :with => :id do
    @user = User[params[:id]]
    if @user
      raise
    else
      error 404
    end
  end
end
