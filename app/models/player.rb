class Player < ActiveRecord::Base
  has_many :roster_spots
  has_many :teams, through: :roster_spots


  validates :first_name, presence: {message: "A player must have a first name."}
  validates :last_name, presence: {message: "A player must have a last name."}
  validates :email, presence: {message: "An email must be provided."}, uniqueness: true
  validates :password_hash, presence: {message: "A palayer must have a password"}
  validates :cell, presence: {message: "A cell phone number must be provided."}
  validates :school_id, presence: {message: "A player must be associated with a school."}
  validates :grad_year, presence: {message: "A HS grad year must be provided."}
end
