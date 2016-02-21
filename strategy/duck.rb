class Duck
  attr_reader :fly_behaviour, :quack_behaviour

  def display
    raise NotImplementedError, "child class must implement method 'display'"
  end

  def swim
    "I'm swimming"
  end

  def perform_quack
    quack_behaviour.quack
  end

  def perform_fly
    fly_behaviour.fly
  end

  def fly_behaviour=(fb)
    unless fb.class.ancestors.include? FlyBehaviour
      raise ArgumentError, "fly behaviour must be inherited from fly behaviour interface"
    end
    @fly_behaviour = fb
  end

  def quack_behaviour=(qb)
    unless qb.class.ancestors.include? QuackBehaviour
      raise ArgumentError, "quack behaviour must be inherited from quack behaviour interface"
    end
    @quack_behaviour = qb
  end

end