require 'spec_helper'

describe "Routing categories" do
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
