class AddAndChangeColumn < ActiveRecord::Migration[5.0]
  def change
    Appointment.delete_all
    rename_column :appointments, :desired_date, :desired_date_from
    add_column :appointments, :desired_date_to, :datetime
    add_column :appointments, :sent_sms, :boolean, default: false
    add_column :appointments, :confirmed_date_from, :datetime
    add_column :appointments, :confirmed_date_to, :datetime
    add_column :appointments, :address, :string
  end
end
