require 'rails_helper'

RSpec.describe ContactsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/contacts').to route_to('contacts#index')
    end

    it 'routes to #index as root' do
      expect(get: '/').to route_to('contacts#index')
    end
  end
end
