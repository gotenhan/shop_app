require 'spec_helper'

describe "Routing categories" do
  context 'for every user' do
    it 'should route GET /categories/ to categories#index' do
      expect(get: '/categories').to route_to({
        controller: 'categories',
        action: 'index'})
    end

    it 'should not route POST /categories' do
      expect(post: '/categories/').not_to be_routable
    end

    it 'should route GET /categories/:id to categories#show(id)' do
      expect(get: '/categories/1').to route_to({
        controller: 'categories',
        action: 'show',
        id: '1'})
    end

    it 'should not route PUT /categories/:id' do
      expect(put: '/categories/1').not_to be_routable
    end

    it 'should not route DELETE /categories/:id' do
      expect(delete: '/categories/1').not_to be_routable
    end

    it 'should not route GET /categories/new' do
      expect(get: '/categories/new').not_to be_routable
    end

    it 'should not route GET /categories/:id/edit' do
      expect(get: '/categories/1/edit').not_to be_routable
    end
  end

  context 'for admin' do
    it 'should route GET /admin/categories/ to admin_categories#index' do
      expect(get: '/admin/categories/').to route_to({
             controller: 'admin/categories',
             action: 'index'})
    end

    it 'should route POST /admin/categories/ to admin_categories#create' do
      expect(post: '/admin/categories/').to route_to({
             controller: 'admin/categories',
             action: 'create'})
    end
    
    it 'should route GET /admin/categories/:id to admin_categories#show(id)' do
      expect(get: '/admin/categories/1').to route_to({
             controller: 'admin/categories',
             action: 'show',
             id: '1'})
    end

    it 'should route PUT /admin/categories/:id to admin_categories#update' do
      expect(put: '/admin/categories/1').to route_to({
             controller: 'admin/categories',
             action: 'update',
             id: '1'})
    end

    it 'should route DELETE  /admin/categories/:id to admin/categories#destroy' do
      expect(delete: '/admin/categories/1').to route_to({
             controller: 'admin/categories',
             action: 'destroy',
             id: '1'})
    end

    it 'should route GET /admin/categories/new to admin/categories#new' do
      expect(get: '/admin/categories/new').to route_to({
             controller: 'admin/categories',
             action: 'new'})
    end

    it 'should route GET /categories/:id/edit to admin/categories#edit(id)' do
      expect(get: '/admin/categories/1/edit').to route_to({
             controller: 'admin/categories',
             action: 'edit',
             id: '1'})
    end
  end
end
