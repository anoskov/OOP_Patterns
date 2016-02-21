require 'strategy/redhead_duck'
require 'strategy/fly_with_wings'
require 'strategy/quack'

RSpec.describe RedheadDuck do

  describe '#behaviour' do
    let(:redhead_duck) { RedheadDuck.new }

    context 'after initialize' do
      it 'be able to swim' do
        expect(redhead_duck.swim).to eq "I'm swimming"
      end

      it 'display info about yourself' do
        expect(redhead_duck.display).to eq "I'm RedHead duck!"
      end
    end

    context 'when set fly behaviour' do
      it 'raise error if behaviour object is not inherited from fly behaviour interface' do
        expect { redhead_duck.fly_behaviour = Quack.new }.to raise_error(ArgumentError)
      end

      it '"fly" method return "cant fly" if set fly with wings behaviour' do
        redhead_duck.fly_behaviour = FlyWithWings.new
        expect(redhead_duck.perform_fly).to eq "I'm flying!"
      end
    end

    context 'when set quack behaviour' do
      it 'raise error if behaviour object is not inherited from quack behaviour interface' do
        expect { redhead_duck.quack_behaviour = FlyWithWings.new }.to raise_error(ArgumentError)
      end

      it '"quack" method return "Quack!" if set quack behaviour' do
        redhead_duck.quack_behaviour = Quack.new
        expect(redhead_duck.perform_quack).to eq "Quack!"
      end
    end

  end

end