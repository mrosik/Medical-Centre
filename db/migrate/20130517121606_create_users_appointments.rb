class CreateUsersAppointments < ActiveRecord::Migration
  def change
    create_table :users_appointments do |t|
      t.integer :appointment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
