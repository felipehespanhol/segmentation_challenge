# == Schema Information
#
# Table name: segments
#
#  id         :integer          not null, primary key
#  name       :string
#  conditions :string
#  operators  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Segment, type: :model do
  it { is_expected.to serialize(:conditions) }
  it { is_expected.to serialize(:operators) }
end
