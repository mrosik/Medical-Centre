class AddDobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :date
    add_column :users, :pps_no, :string
    add_column :users, :gender, :string
    add_column :users, :doctor, :boolean
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
