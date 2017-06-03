# == Schema Information
#
# Table name: conditions
#
#  id         :integer          not null, primary key
#  field      :string
#  name       :string
#  term       :string
#  segment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_conditions_on_segment_id  (segment_id)
#

FactoryGirl.define do
  factory :condition do
    field "email"
    name  "end"
    term  ".com"
    association(:segment)
  end
end
