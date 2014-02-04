class RemoveIdFromSpecialisationsUsers < ActiveRecord::Migration
  def up
    remove_column :specialisations_users, :id
  end

  def down
    add_column :specialisations_users, :id, :integer
  end
end
