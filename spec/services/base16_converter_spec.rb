require 'rails_helper'

describe Base16Converter do
  let(:converter) { Base16Converter.new }

  describe "#encode" do
    it do
      expect(converter.encode(15)).to eq 'f'
    end
  end

  describe "#decode" do
    it do
      expect(converter.decode("f")).to eq 15
    end
  end
end
