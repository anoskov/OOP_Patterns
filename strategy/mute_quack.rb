require_relative 'quack_behaviour'

class MuteQuack < QuackBehaviour

  def quack
    "<silence>..."
  end

end