class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :title
      t.float :lat, {:precision=>10, :scale=>6}
      t.float :lon, {:precision=>10, :scale=>6}
      t.string :category
      t.boolean :acc_cash
      t.boolean :acc_trade
      t.text :description
      t.text :wants
      t.string :quantity
      t.date :harvest_date
      t.date :exp_date
      t.boolean :complete

      t.timestamps
    end
  end
end
