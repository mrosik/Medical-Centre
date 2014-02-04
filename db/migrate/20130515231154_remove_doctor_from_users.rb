class RemoveDoctorFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :doctor
  end

  def down
    add_column :users, :doctor, :boolean
  end
end
