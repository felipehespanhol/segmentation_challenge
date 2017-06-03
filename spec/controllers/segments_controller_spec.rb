require 'rails_helper'

RSpec.describe SegmentsController, type: :controller do
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
end
