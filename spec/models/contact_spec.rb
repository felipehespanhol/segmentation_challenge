require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe ".with_segment" do
    context "when segment has one condition" do
      let!(:international_email_segment) { create(:segment, conditions: { email_ends_with: ".com" }) }
      let!(:international_contact) { create(:international_contact) }
      let!(:brazilian_contact)     { create(:brazilian_contact) }

      it 'returns contacts with matching segment' do
        expect(Contact.with_segment(international_email_segment)).to include(international_contact)
      end

      it 'does not return contacts with matching segment' do
        expect(Contact.with_segment(international_email_segment)).not_to include(brazilian_contact)
      end
    end

    context "when segment has two conditions" do
      context "and operator 'or'" do
        let!(:international_or_teenager_email_segment) do
          create(
            :segment,
            conditions: { email_ends_with: ".com", age_less_than: 19 },
            operators: ['or']
          )
        end
        let!(:international_contact) { create(:international_contact) }
        let!(:teenager_contact)      { create(:brazilian_contact, age: 18) }
        let!(:italian_contact)       { create(:italian_contact) }

        it 'includes contacts with matching segment' do
          contacts = Contact.with_segment(international_or_teenager_email_segment)
          expect(contacts).to include(international_contact)
          expect(contacts).to include(teenager_contact)
        end

        it 'does not include contacts with unmatching segment' do
          contacts = Contact.with_segment(international_or_teenager_email_segment)
          expect(contacts).not_to include(italian_contact)
        end
      end
    end
  end
end
