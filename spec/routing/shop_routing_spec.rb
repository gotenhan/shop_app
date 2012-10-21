describe 'Routing' do
  it 'should route / to shop#index' do
    expect(get: '/').to route_to({
      controller: 'shop',
      action: 'index'})
  end
end
