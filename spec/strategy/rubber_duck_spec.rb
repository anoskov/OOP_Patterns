require 'strategy/rubber_duck'
require 'strategy/fly_no_way'
require 'strategy/squeak'

RSpec.describe RubberDuck do

  describe '#behaviour' do
    let(:rubber_duck) { RubberDuck.new }

    context 'after initialize' do
      it 'be able to swim' do
        expect(rubber_duck.swim).to eq "I'm swimming"
      end

      it 'display info about yourself' do
        expect(rubber_duck.display).to eq "I'm Rubber duck!"
      end
    end

    context 'when set fly behaviour' do
      it 'raise error if behaviour object is not inherited from fly behaviour interface' do
        expect { rubber_duck.fly_behaviour = Squeak.new }.to raise_error(ArgumentError)
      end

      it '"fly" method return "cant fly" if set no fly behaviour' do
        rubber_duck.fly_behaviour = FlyNoWay.new
        expect(rubber_duck.perform_fly).to eq "I can't fly!"
      end
    end

    context 'when set quack behaviour' do
      it 'raise error if behaviour object is not inherited from quack behaviour interface' do
        expect { rubber_duck.quack_behaviour = FlyNoWay.new }.to raise_error(ArgumentError)
      end

      it '"quack" method return "Squeak!" if set squeak behaviour' do
        rubber_duck.quack_behaviour = Squeak.new
        expect(rubber_duck.perform_quack).to eq "Squeak!"
      end
    end

  end

end