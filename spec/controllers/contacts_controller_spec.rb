require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  render_views

  describe '#index' do
    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to be_success
    end
  end
end
