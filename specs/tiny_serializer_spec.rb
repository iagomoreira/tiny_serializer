require 'rspec'
require 'tiny_serializer'
require 'ostruct'

RSpec.describe TinySerializer do
  let(:object) { OpenStruct.new(foo: :bar) }

  context 'when serializer does not have custom method' do
    let!(:dummy) do
      class FooSerializer < TinySerializer
        attributes :foo
      end
    end

    subject(:serializer) { FooSerializer.new(object) }

    describe 'to_h' do
      subject { serializer.to_h }

      it { is_expected.to eq({foo: :bar}) }
    end

    describe 'to_json' do
      subject { serializer.to_json }

      it { is_expected.to eq('{"foo":"bar"}')}
    end
  end

  context 'when serializer has custom method' do
    let!(:dummy) do
      class FooSerializer < TinySerializer
        attributes :foo, :bar

        def bar
          :foo
        end
      end
    end
    subject(:serializer) { FooSerializer.new(object) }

    describe 'to_h' do
      subject { serializer.to_h }

      it { is_expected.to eq({foo: :bar, bar: :foo}) }
    end

    describe 'to_json' do
      subject { serializer.to_json }

      it { is_expected.to eq('{"foo":"bar","bar":"foo"}')}
    end
  end
end
