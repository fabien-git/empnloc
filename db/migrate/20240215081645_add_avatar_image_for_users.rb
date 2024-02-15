class AddAvatarImageForUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :avatar_image, :string
  end
end
