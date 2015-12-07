# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  groups_id        :integer
#  provider         :string
#  uid              :string
#  name             :string
#  oauth_token      :string
#  oauth_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ActiveRecord::Base
  has_many :group_users
  has_many :groups, through: :group_users

  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true
  validates :oauth_token, presence: true
  validates :oauth_expires_at, presence: true
end
