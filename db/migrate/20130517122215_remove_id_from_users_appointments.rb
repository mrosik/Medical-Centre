class RemoveIdFromUsersAppointments < ActiveRecord::Migration
  def up
    remove_column :users_appointments, :id
  end

  def down
    add_column :users_appointments, :id, :integer
  end
end
