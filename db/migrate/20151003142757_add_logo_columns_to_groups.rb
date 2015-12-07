class AddLogoColumnsToGroups < ActiveRecord::Migration
  def up
    add_attachment :groups, :logo
  end

  def down
    remove_attachment :groups, :logo
  end
end
