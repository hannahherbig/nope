class User < Sequel::Model
  one_to_many :statuses

  def self.register(username, password)
    if User[:username => username] || %w(list new).include?(username)
      nil
    else
      user = User.new
      user.username = username
      user.password = password
      user.created_at = Time.now
      user.save
    end
  end

  def self.authenticate(username, password)
    User[:username => username, :password => password]
  end

  def post_status(text)
    status = Status.new
    status.user = self
    status.text = text
    status.created_at = Time.now
    status.save
  end
end
