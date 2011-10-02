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
      @statuses.order(:created_at).all
    else
      Status.order(:created_at).all
    end
  end

  def users
    if @users
      @users.order(:created_at).all
    else
      User.order(:created_at).all
    end
  end

  def need_login!
    flash[:error] = "You need to be logged in to do that."
    redirect url_for(:session, :new)
  end

  def random_sentence
    Nokogiri::HTML(open("http://watchout4snakes.com/CreativityTools/RandomSentence/RandomSentence.aspx")).css('.randomSentence').first.text
  end
end
