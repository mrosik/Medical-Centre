class AddDoctorIdToHour < ActiveRecord::Migration
  def change

    add_column :hours, :doctor_id, :id
    end


end
