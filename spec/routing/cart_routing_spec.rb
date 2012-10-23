require 'spec_helper'

describe 'Routing cart' do
  it 'should route GET /cart to cart#list' do
    expect(get: '/cart').to route_to({
      controller: 'cart',
      action: 'list'
    })
  end

  it 'should not route POST,PUT,DELETE /cart/' do
    expect(post: '/cart').not_to be_routable
    expect(put: '/cart').not_to be_routable
    expect(delete: '/cart').not_to be_routable
  end
  
  it 'should route PUT /cart/add_phone/:id to cart#add' do
    expect(put: '/cart/add_phone/2').to route_to({
      controller: 'cart',
      action: 'add',
      id: '2'
    })
  end

  it 'should not route GET,POST,DELETE /cart/add_phone/:id' do
    expect(get: '/cart/add_phone/2').not_to be_routable
    expect(post: '/cart/add_phone/2').not_to be_routable
    expect(delete: '/cart/add_phone/2').not_to be_routable
  end

  it 'should route PUT /cart/remove_phone/:id to cart#remove' do
    expect(put: '/cart/remove_phone/2').to route_to({
      controller: 'cart',
      action: 'remove',
      id: '2'
    })
  end

  it 'should not route GET,POST,DELETE /cart/remove_phone/:id' do
    expect(get: '/cart/remove_phone/2').not_to be_routable
    expect(post: '/cart/remove_phone/2').not_to be_routable
    expect(put: '/cart/remove_phone/2').not_to be_routable
  end
end
