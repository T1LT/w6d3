# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

%w(users artworks artwork_shares).each do |table_name|
  ApplicationRecord.connection.reset_pk_sequence!(table_name)
end

user1 = User.create!(username: "da_vinci")
user2 = User.create!(username: "van_gogh")
user3 = User.create!(username: "monet")

artwork1 = Artwork.create!(title: "Impression, sunrise", image_url: "https://upload.wikimedia.org/wikipedia/commons/5/59/Monet_-_Impression%2C_Sunrise.jpg", artist_id: 3)
artwork2 = Artwork.create!(title: "The Last Supper", image_url: "https://upload.wikimedia.org/wikipedia/commons/4/48/The_Last_Supper_-_Leonardo_Da_Vinci_-_High_Resolution_32x16.jpg", artist_id: 1)
artwork3 = Artwork.create!(title: "Starry Night", image_url: "https://upload.wikimedia.org/wikipedia/commons/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg", artist_id: 2)

artwork_share1 = ArtworkShare.create!(artwork_id: 2, viewer_id: 3)
artwork_share2 = ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
artwork_share3 = ArtworkShare.create!(artwork_id: 3, viewer_id: 1)

comment1 = Comment.create!(artwork_id: 1, author_id: 1, body: "Impression IMPRESED")
comment2 = Comment.create!(artwork_id: 2, author_id: 2, body: "This makes me hungry")
comment3 = Comment.create!(artwork_id: 3, author_id: 3, body: "Wow! Such stars!")