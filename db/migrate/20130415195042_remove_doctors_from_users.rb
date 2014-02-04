class RemoveDoctorsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :doctor, :boolean
  end
end
