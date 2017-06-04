require 'rails_helper'

RSpec.describe SegmentsController, type: :controller do
  render_views

  describe '#index' do
    let!(:segment1) { create(:segment) }
    let!(:segment2) { create(:segment) }

    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to be_success
    end

    it 'assigns all segments to @segments' do
      expect(assigns(:segments)).to include(segment1)
      expect(assigns(:segments)).to include(segment2)
    end
  end

  describe '#new' do
    before do
      get :new
    end

    it 'returns http success' do
      expect(response).to be_success
    end
  end

  describe "#create" do
    context "when attributes are valid" do
      let!(:segment_attributes) { 
        {
          segment: {
            name: "Adultos São Paulo",
            conditions_attributes: [
              { field: 'state', name: 'eq', term: 'São Paulo' },
              { field: 'age', name: 'gteq', term: '18' }
            ]
          }
        }
      }

      it 'creates one segment' do
        expect {
          post :create, params: segment_attributes
        }.to change {
          Segment.count
        }.by 1
      end

      it 'creates a segment with name' do
        post :create, params: segment_attributes
        segment = Segment.last
        expect(segment.name).to eq(segment_attributes[:segment][:name])
      end

      it 'creates segment conditions' do
        post :create, params: segment_attributes
        segment = Segment.last
        condition1 = segment.conditions[0]
        condition2 = segment.conditions[1]
        expect(condition1.field).to eq(segment_attributes[:segment][:conditions_attributes][0][:field])
        expect(condition1.name).to eq(segment_attributes[:segment][:conditions_attributes][0][:name])
        expect(condition1.term).to eq(segment_attributes[:segment][:conditions_attributes][0][:term])
        expect(condition2.field).to eq(segment_attributes[:segment][:conditions_attributes][1][:field])
        expect(condition2.name).to eq(segment_attributes[:segment][:conditions_attributes][1][:name])
        expect(condition2.term).to eq(segment_attributes[:segment][:conditions_attributes][1][:term])
      end

      it 'redirects to contacts#index' do
        post :create, params: segment_attributes
        expect(response).to redirect_to(contacts_path)
      end
    end

    context "when attributes are not valid" do
      let!(:segment_attributes) { { segment: {} } }

      it "renders 'new'" do
        post :create, params: segment_attributes
        expect(response).to render_template(:new)
      end
    end
  end

  describe "#destroy" do
    let!(:segment) { create(:segment) }

    it 'destroys segment' do
      expect {
        delete :destroy, params: { id: segment.id }
      }.to change {
        Segment.count
      }.by -1
    end

    it 'redirects to segments#index' do
      delete :destroy, params: { id: segment.id }
      expect(response).to redirect_to(segments_path)
    end
  end
end
