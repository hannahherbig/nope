Nope.controllers do
  get :index do
    title "Public timeline"
    render 'status/list'
  end
end
