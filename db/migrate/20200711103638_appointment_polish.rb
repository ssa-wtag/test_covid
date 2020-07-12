class AppointmentPolish < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :result, :boolean, default: false
    add_column :appointments, :covid_positive, :boolean
    add_column :appointments, :district, :string
    add_column :appointments, :upazila, :string
    add_column :appointments, :second_time, :boolean
    add_column :appointments, :willing_to_plasma_donation, :boolean
    add_column :appointments, :gender, :string
    add_column :appointments, :age, :string
  end
end
