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
  has_many :conditions, inverse_of: :segment, dependent: :destroy

  validates :name, :operator, presence: true

  accepts_nested_attributes_for :conditions,
    reject_if: proc { |attributes| attributes[:field].blank? || attributes[:term].blank? },
    allow_destroy: true

  def search_hash
    conditions.inject({}) do |result, condition|
      result[:"#{condition.field}_#{condition.name}"] = condition.term
      result
    end.merge(m: operator)
  end

  def self.i18n_operators
    [
      [I18n.t('operators.and'), 'and'],
      [I18n.t('operators.or'), 'or']
    ]
  end
end
