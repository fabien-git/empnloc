class AddColumnToEmployee < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :imageAvatar, :string
  end
end
