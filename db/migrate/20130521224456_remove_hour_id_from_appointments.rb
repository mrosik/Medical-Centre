class RemoveHourIdFromAppointments < ActiveRecord::Migration
  def up
    remove_column :appointments, :hour_id
    remove_column :users, :hour_id
  end

  def down
    add_column :appointments, :hour_id, :integer
    add_column :users, :hour_id, :integer
  end
end
