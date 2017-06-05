require 'rspec'
require 'tiny_serializer'
require 'ostruct'

RSpec.describe TinySerializer do
  let!(:dummy) do
    class FooSerializer < TinySerializer
      attributes :foo
    end
  end

  let(:object) { OpenStruct.new(foo: :bar) }
  subject(:serializer) { described_class.new(object) }

  describe 'to_h' do
    subject { serializer.to_h }

    it { is_expected.to eq({foo: :bar}) }
  end
end
