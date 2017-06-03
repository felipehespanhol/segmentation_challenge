require 'rails_helper'

RSpec.describe SegmentsController, type: :controller do
  describe '#index' do
    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to be_success
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
