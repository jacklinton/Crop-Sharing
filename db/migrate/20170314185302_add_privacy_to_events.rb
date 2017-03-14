class AddPrivacyToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :private_event, :boolean
  end
end
