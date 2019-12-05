class ChangeDefaultUserPhoto < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :photo, "https://res.cloudinary.com/bia-app/image/upload/v1575539258/profile_picture_unavailable_bkap0a.svg"
  end
end
