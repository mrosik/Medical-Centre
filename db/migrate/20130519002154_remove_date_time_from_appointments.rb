class RemoveDateTimeFromAppointments < ActiveRecord::Migration
  def up
    remove_column :appointments, :date_time, :price, :description
    add_column :appointments, :time_slot_id, :integer
    add_column :appointments, :patient_id, :integer
  end

  def down
    add_column :appointments, :date_time, :datetime
    add_column :appointments, :price , :float
    add_column :appointments, :description, :text
    remove_column :appointments, :time_slot_id, :patient_id
  end
end
