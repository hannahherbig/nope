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
      need_login!
    end
  end

  get :list do
    redirect url_for(:index)
  end

  get :destroy, :with => :id do
    status = Status[params[:id]]
    if status.nil?
      raise 404
    elsif current_user
      if status.user == current_user
        status.delete
        flash[:notice] = "Status deleted"
        redirect url_for(:index)
      else
        flash[:error] = "You don't own that status."
        redirect url_for(:index)
      end
    else
      need_login!
    end
  end
end
