class AppointmentTableColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :appointments, :result, :binary
  end
end
