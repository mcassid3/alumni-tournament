class Player < ActiveRecord::Base
  has_many :roster_spots
  has_many :teams, through: :roster_spots


  validates :first_name, presence: {message: "A player must have a first name."}
  validates :last_name, presence: {message: "A player must have a last name."}
  validates :email, presence: {message: "An email must be provided."}
  validates :password_hash, presence: {message: "A palayer must have a password"}
  validates :cell, presence: {message: "A cell phone number must be provided."}
  validates :school_id, presence: {message: "A player must be associated with a school."}

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(plain_pw)
    self.password_hash = BCrypt::Password.create(plain_pw)
  end

  def authenticate(plain_pw)
    self.password == plain_pw
  end

end
