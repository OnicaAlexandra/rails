class AddEndTimeToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :end_time, :datetime
  end
end
