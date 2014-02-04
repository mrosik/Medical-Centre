class RenameXappointmentToAppointment < ActiveRecord::Migration
  def up
    rename_table :xappointments, :appointments
  end

  def down
    rename_table :appointments, :xappointments
  end
end
