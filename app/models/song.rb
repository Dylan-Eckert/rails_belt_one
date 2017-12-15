class Song < ApplicationRecord
  belongs_to :user
  has_many :playlists
  has_many :playlists_added_to, through: :playlists, source: :user

  validates :artist, :title, presence: :true
  validates :artist, length:{minimum:2}
  validates :title, length:{minimum:2}

  before_save :input_format
  def input_format
    self.artist.downcase!
    self.title.downcase!
  end
end
