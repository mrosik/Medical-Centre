class CreateSpecialisations < ActiveRecord::Migration
  def change
    create_table :specialisations do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
