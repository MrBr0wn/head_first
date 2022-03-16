# frozen_string_literal: true

require 'Ch_2/classes'

RSpec.describe Dog1 do
  subject(:instance) { described_class.new }
  let(:object) { described_class.new }

  context 'with invalid some argument' do
    describe 'instance variables' do
      it 'return raise message if @name is empty' do
        expect { object.name = '' }.to raise_error(RuntimeError, /Name can't/)
      end

      it 'return raise message if @age is empty' do
        expect { object.age = 0 }.to raise_error(RuntimeError, /An age of/)
      end
    end
  end

  context 'with valid all argiments' do
    describe '#move' do
      let(:name) { 'Goodboy' }
      it 'return string with destination and @name' do
        instance.name = :name
        expect { instance.move('target') }.to output(match(/#{instance.name} runs to the/)).to_stdout
      end
    end

    describe '#talk' do
      it 'return string with Bark' do
        instance.name = :name
        expect { instance.talk }.to output(match(/#{instance.name} says Bark!/)).to_stdout
      end
    end

    describe '#report_age' do
      it 'return string with @name and @age' do
        instance.name = :name
        instance.age = 50
        expect { instance.report_age }.to output(match(/#{instance.name} is #{instance.age}/)).to_stdout
      end
    end
  end
end
