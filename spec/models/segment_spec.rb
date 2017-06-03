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

require 'rails_helper'

RSpec.describe Segment, type: :model do
  it { is_expected.to have_many(:conditions) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:operator) }
  it { is_expected.to accept_nested_attributes_for(:conditions) }

  describe "#search_hash" do
    context "when operator is nil" do
      let!(:segment)    { create(:segment, name: "riodejaneiro.com") }
      let!(:condition1) { segment.conditions.create(field: "state", name: "eq", term: "Rio de Janeiro") }
      let!(:condition2) { segment.conditions.create(field: "email", name: "end", term: ".com") }

      it 'returns ransack compatible search hash' do
        expect(segment.search_hash).to eq({ state_eq: "Rio de Janeiro", email_end: ".com", m: 'and' })
      end
    end

    context "when operator is 'or'" do
      let!(:segment) do
        create(:segment, name: "riodejaneiro.com", operator: 'or', conditions: [
          build(:condition, field: "state", name: "eq", term: "Rio de Janeiro"),
          build(:condition, field: "email", name: "end", term: ".com")
        ])
      end

      it 'returns ransack compatible search hash' do
        expect(segment.search_hash).to eq({ state_eq: "Rio de Janeiro", email_end: ".com", m: 'or' })
      end
    end
  end
end
