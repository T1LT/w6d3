# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy,
    inverse_of: :artist

  has_many :shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy,
    inverse_of: :viewer

  #This User#shared_artworks association should return the set of artworks that have been shared with that user, 
  #not the set of artworks that a user has shared with others.
  has_many :shared_artworks,
    through: :shares,
    source: :artwork
end
