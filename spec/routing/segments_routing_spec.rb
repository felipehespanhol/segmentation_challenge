require 'rails_helper'

RSpec.describe SegmentsController, type: :routing do
  describe 'routing' do
    it 'routes segments#index to GET /segments' do
      expect(get: '/segments').to route_to('segments#index')
    end

    it 'routes segments#new to GET /segments/new' do
      expect(get: '/segments/new').to route_to('segments#new')
    end

    it 'routes segments#index to POST /segments' do
      expect(post: '/segments').to route_to('segments#create')
    end
  end
  
end
