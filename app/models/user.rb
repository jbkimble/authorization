class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    @user.find_by(:email)
    if @user[:password] == password
      @user
    else
      nil
    end
  end
end
