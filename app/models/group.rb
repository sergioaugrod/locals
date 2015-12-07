# == Schema Information
#
# Table name: groups
#
#  id                :integer          not null, primary key
#  creator_id        :integer
#  name              :string
#  latitude          :decimal(15, 10)
#  longitude         :decimal(15, 10)
#  active            :boolean          default(TRUE)
#  private           :boolean          default(FALSE)
#  password          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Group < ActiveRecord::Base
  acts_as_mappable default_units: :kms, lat_column_name: :latitude, lng_column_name: :longitude

  has_attached_file :logo, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :logo, content_type: %r{image/.*}

  belongs_to :creator, class_name: 'User'

  has_many :group_users
  has_many :users, through: :group_users

  has_many :images

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
