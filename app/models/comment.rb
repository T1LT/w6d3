# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  author_id  :bigint           not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  belongs_to  :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
    
end
