require 'rails_helper'

RSpec.describe PeopleController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/people').to route_to('people#index')
    end

    it 'routes to #show' do
      expect(get: '/people/1').to route_to('people#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/people').to route_to('people#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/people/1').to route_to('people#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/people/1').to route_to('people#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/people/1').to route_to('people#destroy', id: '1')
    end
  end
end
