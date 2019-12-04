class UpdatePhotoForUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :photo, "image/upload/v1575220079/profile_picture_unavailable_gwyjic.jpg"
  end
end
