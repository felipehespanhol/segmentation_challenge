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

  describe "#string_fields_names validation" do
    let!(:segment) { create(:segment) }

    ['name', 'email', 'state', 'job']. each do |contact_field|
      context "when field is #{contact_field}" do
        ['eq', 'cont', 'start', 'end'].each do |condition_name|
          it "allows condition #{condition_name}" do
            expect(segment.conditions.build(field: contact_field, name: condition_name, term: "teste")).to be_valid
          end
        end
        ['lt', 'lteq', 'gt', 'gteq', 'other'].each do |condition_name|
          it "does not allow condition #{condition_name}" do
            expect(segment.conditions.build(field: contact_field, name: condition_name, term: "teste")).not_to be_valid
          end
        end
      end
    end

    ['age']. each do |contact_field|
      context "when field is #{contact_field}" do
        ['lt', 'lteq', 'gt', 'gteq'].each do |condition_name|
          it "allows condition #{condition_name}" do
            expect(segment.conditions.build(field: contact_field, name: condition_name, term: "teste")).to be_valid
          end
        end
        ['name', 'email', 'state', 'job', 'other'].each do |condition_name|
          it "does not allow condition #{condition_name}" do
            expect(segment.conditions.build(field: contact_field, name: condition_name, term: "teste")).not_to be_valid
          end
        end
      end
    end
  end
end
