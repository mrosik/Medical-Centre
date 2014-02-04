class AddSpecialisationsUsers < ActiveRecord::Migration
  def change
    create_table :specialisations_users do |t|
      t.integer :user_id
      t.integer :specialisation_id
    end
  end
end

