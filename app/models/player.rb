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

  # def in_system?

  # end

  # def on_a_current_team?
  #   email_check = Player.find_by(email: self.email)
  #   last_name_check = Player.find_by(last_name: self.last_name)
  #   first_name_check = Player.find_by(first_name: self.first_name)
  #   if email_check == last_name_check == first_name_check


  # end


end
