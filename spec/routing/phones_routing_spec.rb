require 'spec_helper'

describe 'Routing phones' do
  context 'for every user' do
    it 'should route GET /phones/ to phones#index' do
      expect(get: '/phones').to route_to({
        controller: 'phones',
        action: 'index'})
    end

    it 'should not route POST /phones' do
      expect(post: '/phones/').not_to be_routable
    end

    it 'should route GET /phones/:id to phones#show(id)' do
      expect(get: '/phones/1').to route_to({
        controller: 'phones',
        action: 'show',
        id: '1'})
    end

    it 'should not route PUT /phones/:id' do
      expect(put: '/phones/1').not_to be_routable
    end

    it 'should not route DELETE /phones/:id' do
      expect(delete: '/phones/1').not_to be_routable
    end

    it 'should not route GET /phones/new' do
      expect(get: '/phones/new').not_to be_routable
    end

    it 'should not route GET /phones/:id/edit' do
      expect(get: '/phones/1/edit').not_to be_routable
    end
  end

  context 'for admin' do
    it 'should route GET /admin/phones/ to admin_phones#index' do
      expect(get: '/admin/phones').to route_to({
             controller: 'admin/phones',
             action: 'index'})
    end

    it 'should route POST /admin/phones/ to admin_phones#create' do
      expect(post: '/admin/phones/').to route_to({
             controller: 'admin/phones',
             action: 'create'})
    end
    
    it 'should route GET /admin/phones/:id to admin_phones#show(id)' do
      expect(get: '/admin/phones/1').to route_to({
             controller: 'admin/phones',
             action: 'show',
             id: '1'})
    end

    it 'should route PUT /admin/phones/:id to admin_phones#update' do
      expect(put: '/admin/phones/1').to route_to({
             controller: 'admin/phones',
             action: 'update',
             id: '1'})
    end

    it 'should route DELETE  /admin/phones/:id to admin/phones#destroy' do
      expect(delete: '/admin/phones/1').to route_to({
             controller: 'admin/phones',
             action: 'destroy',
             id: '1'})
    end

    it 'should route GET /admin/phones/new to admin/phones#new' do
      expect(get: '/admin/phones/new').to route_to({
             controller: 'admin/phones',
             action: 'new'})
    end

    it 'should route GET /phones/:id/edit to admin/phones#edit(id)' do
      expect(get: '/admin/phones/1/edit').to route_to({
             controller: 'admin/phones',
             action: 'edit',
             id: '1'})
    end
  end
end
