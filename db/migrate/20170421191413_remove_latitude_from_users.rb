class RemoveLatitudeFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :latitude, :string
  end
end
