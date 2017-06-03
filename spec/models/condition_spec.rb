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

require 'rails_helper'

RSpec.describe Condition, type: :model do
  it { is_expected.to belong_to(:segment) }
  it { is_expected.to validate_presence_of(:field) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:term) }
end
