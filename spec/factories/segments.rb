# == Schema Information
#
# Table name: segments
#
#  id         :integer          not null, primary key
#  name       :string
#  operator   :string           default("and")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do 
  factory :segment do
    name "International Emails" 
  end
end
