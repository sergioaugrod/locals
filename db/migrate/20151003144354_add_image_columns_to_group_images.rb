class AddImageColumnsToGroupImages < ActiveRecord::Migration
  def up
    add_attachment :group_images, :image
  end

  def down
    remove_attachment :group_images, :image
  end
end
