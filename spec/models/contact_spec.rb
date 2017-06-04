# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  age        :integer
#  state      :string
#  job        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to validate_presence_of(:age) }
  it { is_expected.to validate_presence_of(:job) }
  it { is_expected.to validate_numaricality_of(:age) }

  describe ".search_with_segments" do
    let!(:adult_dot_com_contact) { create(:contact, name: "Adriano", email: "adriano@email.com", age: 18) }
    let!(:adult_dot_uk_contact)  { create(:contact, name: "John", email: "john@email.uk", age: 18) }
    let!(:teen_contact)          { create(:contact, name: "Josephin", email: "josephin@email.com", age: 17) }
    let!(:adult_segment) {
      create(:segment, name: "Adults", conditions_attributes: [{field: 'age', name: 'gteq', term: 18}]) }
    let!(:dot_com_segment) {
      create(:segment, name: ".com", conditions_attributes: [{field: 'email', name: 'end', term: '.com'}]) }

    it 'returns matching contacts' do
      expect(Contact.search_with_segments([adult_segment, dot_com_segment])).to include(adult_dot_com_contact)
    end

    it 'does not return unmatching contacts' do
      contacts = Contact.search_with_segments([adult_segment, dot_com_segment])
      expect(contacts).not_to include(adult_dot_uk_contact)
      expect(contacts).not_to include(teen_contact)
    end
  end
end
