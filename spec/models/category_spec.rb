describe Category do
  describe '#new' do
    it 'should not allow to crete category without name' do
      category = Category.new
      expect(category.valid?).to be_false
      expect(category.errors.keys).to include(:name)
    end  
  end
end
