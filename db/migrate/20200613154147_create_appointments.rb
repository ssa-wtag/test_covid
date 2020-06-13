class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.datetime :desired_date
      t.timestamps
    end
  end
end
