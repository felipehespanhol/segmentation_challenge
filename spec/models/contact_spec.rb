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
  it { is_expected.to validate_numericality_of(:age) }

  describe ".search_with_segments" do
    let!(:adult_dot_com_contact) { create(:contact, name: "Adriano", email: "adriano@email.com", age: 28) }
    let!(:adult_uk_contact)      { create(:contact, name: "John", email: "john@email.co.uk", age: 20) }
    let!(:teen_contact)          { create(:contact, name: "Josephin", email: "josephin@email.com", age: 17) }
    let!(:teen_segment) {
      create(:segment, name: "Teens", conditions_attributes: [{field: 'age', name: 'lteq', term: 19}]) }
    let!(:uk_segment) {
      create(:segment, name: ".co.uk", conditions_attributes: [{field: 'email', name: 'end', term: '.co.uk'}]) }

    it 'returns matching contacts' do
      contacts = Contact.search_with_segments([teen_segment, uk_segment])
      expect(contacts).to include(teen_contact)
      expect(contacts).to include(adult_uk_contact)
    end

    it 'does not return unmatching contacts' do
      contacts = Contact.search_with_segments([teen_segment, uk_segment])
      expect(contacts).not_to include(adult_dot_com_contact)
    end
  end
end
