class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :date_time
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
