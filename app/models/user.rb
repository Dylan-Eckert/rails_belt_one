class User < ApplicationRecord
  has_secure_password
  has_many :songs
  has_many :playlists
  has_many :songs_added, through: :playlists, source: :song



  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :fname, :lname, presence: :true

  before_save :input_format

  def input_format
    self.email.downcase!
    self.fname.downcase!
    self.lname.downcase!
  end
end
