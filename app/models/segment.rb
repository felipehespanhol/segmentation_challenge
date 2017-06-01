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

class Segment < ApplicationRecord
  serialize :conditions, Hash
  serialize :operators, Array
end
