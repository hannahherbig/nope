class Status < Sequel::Model
  many_to_one :user

  def before_create
    self.created_at = Time.now
  end
end
