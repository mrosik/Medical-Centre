class RemoveCreatedAtFromUsersAppointments < ActiveRecord::Migration
  def up
    remove_column :users_appointments, :created_at, :updated_at

  end

  def down
  end
end
