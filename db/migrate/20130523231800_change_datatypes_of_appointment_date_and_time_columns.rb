class ChangeDatatypesOfAppointmentDateAndTimeColumns < ActiveRecord::Migration
  def up
    change_column :hours, :appointment_time, :time
    change_column :hours, :appointment_date, :date
  end

  def down
    change_column :hours, :appointment_time, :text
    change_column :hours, :appointment_date, :text
  end
end
