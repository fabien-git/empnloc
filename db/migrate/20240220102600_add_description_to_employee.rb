class AddDescriptionToEmployee < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :description, :text
  end
end
