require 'spec_helper'

describe PhonesHelper do
  describe '#info' do
    context 'given blank argument' do
      it "should return 'brak informacji'" do
        expect( info nil ).to eql 'brak informacji'
        expect( info '' ).to eql 'brak informacji'
      end

      it 'should return custom text if specified' do
        expect( info nil, 'custom text' ).to eql 'custom text'
      end
    end

    context "given non-blank argument" do
      it "should return its value" do
        expect( info 'test').to eql 'test'
      end
    end
  end

  describe '#feature' do
    context 'given nil or false argument' do
      it "should return 'nie'" do
        expect(feature nil).to eql 'nie'
        expect(feature false).to eql 'nie'
      end
    end

    context "given true argument" do
      it "should return 'tak'" do
        expect(feature true).to eql 'tak'
      end

      it "should return 'tak, custom_text' if custom text specified" do
        expect(feature true, 'custom text').to eql 'tak, custom text'
      end
    end
  end
end
