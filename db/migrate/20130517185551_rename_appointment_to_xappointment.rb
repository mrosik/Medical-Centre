class RenameAppointmentToXappointment < ActiveRecord::Migration
  def up
    rename_table :appointments, :xappointments
  end

  def down
    rename_table :xappointments, :appointments
  end
end
