class AddProfileAndBannerImagesToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_image, :string
    add_column :users, :banner_image, :string
  end
end
