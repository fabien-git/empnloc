class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.integer :total_price
      t.integer :renting_days
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
