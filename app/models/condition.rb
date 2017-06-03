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

class Condition < ApplicationRecord
  belongs_to :segment, inverse_of: :conditions

  validates :field, :name, :term, :segment, presence: true
  validate :field_name_type

  STRING_FIELD_ALLOWED_NAMES  = ['eq', 'cont', 'start', 'end']
  INTEGER_FIELD_ALLOWED_NAMES = ['lt', 'lteq', 'gt', 'gteq']

  private

  def field_name_type
    field_type = Contact.columns.find {|c| c.name == field}&.type
    if field_type.nil?
      errors.add(:field, "#{Contact.model_name.human} does not have field with name #{field}")
    elsif field_type == :string && !STRING_FIELD_ALLOWED_NAMES.include?(name)
      errors.add(:name, "must any of #{STRING_FIELD_ALLOWED_NAMES.join(', ')}")
    elsif field_type == :integer && !INTEGER_FIELD_ALLOWED_NAMES.include?(name)
      errors.add(:name, "must any of #{INTEGER_FIELD_ALLOWED_NAMES.join(', ')}")
    end
  end
end
