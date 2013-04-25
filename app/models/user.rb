class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates :email, :uniqueness => true
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.login(params)
    @user = User.find_by_email(params[:email])
    return false if @user == nil
    @user.password == params[:password]
  end
end
