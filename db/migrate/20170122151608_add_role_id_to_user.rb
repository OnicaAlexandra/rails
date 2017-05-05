class AddRoleIdToUser < ActiveRecord::Migration[5.0]
  #def change
#    add_reference :users, :role, foreign_key: true
 
def change
      add_column :users, :role, :integer
   end
  #end
end
