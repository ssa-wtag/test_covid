class AddSlotIdToAppointment < ActiveRecord::Migration[5.0]
  def change
    rename_column :appointments, :desired_date_from, :desired_date
    rename_column :appointments, :confirmed_date_from, :confirmed_date
    change_column :appointments, :desired_date, :date
    change_column :appointments, :confirmed_date, :date
    remove_column :appointments, :desired_date_to
    remove_column :appointments, :confirmed_date_to
    add_column :appointments, :slot_id, :integer
  end
end
