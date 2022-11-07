class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :physician
      t.references :patient
      t.datetime :appoinment_date

      t.timestamps
    end
  end
end
