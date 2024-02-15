class AddAvatarImageForEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :avatar_image, :string
  end
end
