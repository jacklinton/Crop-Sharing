class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :event_id
      t.boolean :bring

      t.timestamps
    end
  end
end
