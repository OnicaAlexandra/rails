class CreateEventParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :event_participants do |t|
      t.belongs_to :user , index: true
      t.belongs_to :post , index: true
      t.timestamps
    end
  end
end
