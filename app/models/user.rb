class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: { on: create }, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email,password)
    found_user = User.where('LOWER(email) = ?', email.strip.downcase).first
    if found_user && found_user.authenticate(password)
      found_user
    else
      nil
    end
  end
end
