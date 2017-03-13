class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
