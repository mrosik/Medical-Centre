class RenameTimeSlotIdToHourId < ActiveRecord::Migration
  def up
    rename_column :appointments, :time_slot_id, :hour_id
  end

  def down
    rename_column :appointments,:hour_id, :time_slot_id
  end
end
