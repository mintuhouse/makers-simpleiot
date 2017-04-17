# == Schema Information
#
# Table name: user_devices
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  device_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserDevice < ApplicationRecord
  belongs_to :user
  belongs_to :device
  accepts_nested_attributes_for :device
end
