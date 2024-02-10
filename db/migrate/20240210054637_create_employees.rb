class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.integer :price_per_day

      t.timestamps
    end
  end
end
