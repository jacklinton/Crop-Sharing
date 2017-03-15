class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :type
      t.string :name
      t.date :date
      t.float :lat
      t.float :lng
      t.text :description

      t.timestamps
    end
  end
end
