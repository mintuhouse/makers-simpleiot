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

FactoryGirl.define do
  factory :device do
    name "MyString"
    secret "MyString"
    data "MyString"
  end
end
