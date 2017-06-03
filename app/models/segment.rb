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

class Segment < ApplicationRecord
  has_many :conditions

  validates :name, :operator, presence: true

  def search_hash
    conditions.inject({}) do |result, condition|
      result[:"#{condition.field}_#{condition.name}"] = condition.term
      result
    end.merge(m: operator)
  end
end
