class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork, null: false, foreign_key: true
      t.references :viewer, null: false, foreign_key: { to_table: :users }
      t.index [ :viewer_id, :artwork_id ], unique: true
      t.timestamps
    end
  end
end
