class RemoveAppointmentTimeFromHours < ActiveRecord::Migration
  def up
    remove_column :hours, :appointment_time
    remove_column :hours, :appointment_date

  end

  def down
    add_column :hours, :appointment_time, :text
    add_column :hours, :appointment_time, :text

  end
end
