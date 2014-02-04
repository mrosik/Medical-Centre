class AddAppointmentTimeToHours < ActiveRecord::Migration
  def change
    add_column :hours, :appointment_time, :time
    add_column :hours, :appointment_date, :date
  end
end
