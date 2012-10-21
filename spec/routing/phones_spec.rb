require 'spec_helper'

describe 'Routing phones' do
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
