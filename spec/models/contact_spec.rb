require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe ".with_segment" do
    let(:international_email_segment) { create(:segment, conditions: { email_ends_with: ".com" }) }
    let(:international_contact) { create(:contact, email: "felipe@totalcommit.com") }
    let(:brazilian_contact)     { create(:contact, email: "reinaldo@email.com.br") }

    it 'returns contacts with matching segment' do
      expect(Contact.with_segment(international_email_segment)).to include(international_contact)
    end

    it 'does not return contacts with matching segment' do
      expect(Contact.with_segment(international_email_segment)).to be_empty
    end
  end
end
