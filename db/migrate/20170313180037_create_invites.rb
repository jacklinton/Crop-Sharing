class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.integer :event_id
      t.integer :user_to
      t.integer :user_from
      t.boolean :accepted

      t.timestamps
    end
  end
end
