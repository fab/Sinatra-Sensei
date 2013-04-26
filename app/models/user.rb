class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :password, :presence => true
  validates :email, :uniqueness => true, :presence => true
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

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
