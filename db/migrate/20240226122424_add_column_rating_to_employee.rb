class AddColumnRatingToEmployee < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :rating, :integer
  end
end
