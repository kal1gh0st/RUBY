#Stage 2 adding in rest
class Player
  def play_turn(warrior)
    if warrior.health < 10 && warrior.feel.empty?
      warrior.rest!
    elsif warrior.feel.empty?
      warrior.walk!
    else
      warrior.attack!
    end
  end
end
