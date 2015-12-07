# == Schema Information
#
# Table name: group_images
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  group_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Group
  class Image < ActiveRecord::Base
    has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }
    validates_attachment_content_type :image, content_type: %r{image/.*}

    belongs_to :user
    belongs_to :group
  end
end
