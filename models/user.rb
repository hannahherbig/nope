class User < Sequel::Model
  one_to_many :statuses

  def before_destroy
    statuses.each { |s| s.destroy }
  end

  def self.register(username, password)
    if User[:username => username] || %w(list new create destroy).include?(username)
      nil
    else
      user = User.new
      user.username = username
      user.password = password
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
    status.save
  end
end
