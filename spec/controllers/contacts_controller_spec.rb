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
  end
end
