# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  name       :string
#  secret     :string
#  data       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'securerandom'

class Device < ApplicationRecord
  has_many :user_devices
  has_many :users, through: :user_devices
  validates_presence_of :name, :secret
  before_validation :assign_new_secret
  validates_uniqueness_of :secret

  private
  def assign_new_secret
    self.secret ||= SecureRandom.hex
  end
end
