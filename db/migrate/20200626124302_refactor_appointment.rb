class RefactorAppointment < ActiveRecord::Migration[5.0]
  def change
    remove_column :appointments, :last_name
    add_column :appointments, :email, :string
    add_column :appointments, :serial, :string
    add_column :appointments, :result, :binary, limit: 2.megabytes
    rename_column(:appointments, :first_name, :name)
  end
end
