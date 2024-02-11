class AddAvatarImgToEmployee < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :avatar_img, :string
  end
end
