class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.text :appointment_time
      t.text :appointment_date
      t.integer :doctor_id
      t.timestamps
    end
  end
end
