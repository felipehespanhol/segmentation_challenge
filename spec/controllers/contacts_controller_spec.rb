require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  render_views

  describe '#index' do
    context "when no search param is given" do
      let!(:contact1) { create(:contact) }
      let!(:contact2) { create(:contact) }
      let!(:segments) { create_list(:segment, 2) }

      before do
        get :index
      end

      it 'returns http success' do
        expect(response).to be_success
      end

      it 'assigns all contacts to @contacts' do
        expect(assigns(:contacts)).to include(contact1)
        expect(assigns(:contacts)).to include(contact2)
      end

      it 'assigns all segments to @segments' do
        expect(assigns(:segments_list)).to match_array(segments)
      end
    end

    context "when segments ids are given" do
      let!(:rio_de_janeiro_contact) { create(:contact, state: "Rio de Janeiro") }
      let!(:sao_paulo_contact) { create(:contact, state: "São Paulo") }
      let!(:segment)  {
        create(
          :segment,
          name: 'Rio de Janeiro',
          conditions_attributes: [{ field: 'state', name: 'eq', term: 'Rio de Janeiro'}]
        )
      }

      before do
        get :index, { segments_ids: [segment.id] }
      end

      it 'filters contact with segment' do
        expect(assigns(:contacts)).to include(rio_de_janeiro_contact)
        expect(assigns(:contacts)).not_to include(sao_paulo_contact)
      end
    end
  end

  describe "#new" do
    it 'returns http success' do
      get :new
      expect(response).to be_success
    end
  end

  describe "#create" do
    context "when attributes are valid" do
      let!(:contact_attributes) { 
        {
          contact: {
            name: "Felipe Hespanhol",
            email: "felipe@email.com",
            state: "Rio de Janeiro",
            age: 32,
            job: "Software Developer"
          }
        }
      }

      it 'creates one contact' do
        expect {
          post :create, params: contact_attributes
        }.to change {
          Contact.count
        }.by 1
      end

      it 'creates a contact with name' do
        post :create, params: contact_attributes
        contact = Contact.last
        expect(contact.name).to eq(contact_attributes[:contact][:name])
        expect(contact.email).to eq(contact_attributes[:contact][:email])
        expect(contact.state).to eq(contact_attributes[:contact][:state])
        expect(contact.age).to eq(contact_attributes[:contact][:age])
        expect(contact.job).to eq(contact_attributes[:contact][:job])
      end

      it 'redirects to contacts#index' do
        post :create, params: contact_attributes
        expect(response).to redirect_to(contacts_path)
      end
    end

    context "when attributes are not valid" do
      let!(:contact_attributes) { { contact: {} } }

      it "renders 'new'" do
        post :create, params: contact_attributes
        expect(response).to render_template(:new)
      end
    end
  end

end
