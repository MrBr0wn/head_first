# frozen_string_literal: true

require 'Ch_3/animal'

RSpec.describe Animal do
  let(:animal) { described_class.new }

  context 'parent class methods' do
    context 'with invalid some argument' do
      describe 'instance variables' do
        it 'return raise message if @name is empty' do
          expect { animal.name = '' }.to raise_error(RuntimeError, /Name can't/)
        end

        it 'return raise message if @age is zero' do
          expect { animal.age = 0 }.to raise_error(RuntimeError, /An age of/)
        end
      end
    end

    context 'with valid all arguments' do
      before do
        animal.name = 'Animal'
        animal.age = 5
      end

      describe '#talk' do
        it 'return some sound' do
          expect { animal.talk }.to output(match(/#{animal.name} says/)).to_stdout
        end
      end

      describe '#move' do
        it 'return string with destination and @name' do
          expect { animal.move('target') }.to output(match(/#{animal.name} runs to the/)).to_stdout
        end
      end

      describe '#report_age' do
        it 'return string with @name and @age' do
          expect { animal.report_age }.to output(match(/#{animal.name} is #{animal.age}/)).to_stdout
        end
      end
    end
  end

  context 'childrens classes methods' do
    describe Dog do
      let(:dog) { described_class.new }

      it 'should be children of Animal' do
        expect(dog).to be_kind_of(Animal)
      end

      describe '#to_s' do
        it 'return string' do
          dog.name = 'Dog'
          dog.age = 5
          expect(dog.to_s).to be_an_instance_of(String)
          expect(dog.to_s).to match(/#{dog.name} the dog, #{dog.age} yers old./)
        end
      end

      describe '#talk' do
        it 'return string with Bark!' do
          dog.name = 'Rex'
          expect { dog.talk }.to output(match(/#{dog.name} says Bark!/)).to_stdout
        end
      end
    end

    describe Cat do
      let(:cat) { described_class.new }

      it 'should be children of Animal' do
        expect(cat).to be_kind_of(Animal)
      end

      describe '#talk' do
        it 'return string with Nyan!' do
          cat.name = 'Nyancat'
          expect { cat.talk }.to output(match(/#{cat.name} says Nyan!/)).to_stdout
        end
      end
    end

    describe Bird do
      let(:bird) { described_class.new }

      it 'should be children of Animal' do
        expect(bird).to be_kind_of(Animal)
      end

      describe '#talk' do
        it 'return string with Chirik-chirik!' do
          bird.name = 'Polly'
          expect { bird.talk }.to output(match(/#{bird.name} says Chirik-chirik!/)).to_stdout
        end
      end
    end

    describe Armadillo do
      let(:arma) { described_class.new }

      it 'should be children of Animal' do
        expect(arma).to be_kind_of(Animal)
      end

      describe '#move' do
        it 'return self and parent\'s strings' do
          arma.name = 'Arma'
          destination = 'target'
          parent = "#{arma.name} runs to the #{destination}."
          children = "#{arma.name} unrolls"

          expect { arma.move(destination) }.to output(match(/#{children}/)).to_stdout
          expect { arma.move(destination) }.to output(match(/#{parent}/)).to_stdout
        end
      end
    end
  end
end
