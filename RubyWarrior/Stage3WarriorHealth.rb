#Stage 3
class Player
  def play_turn(warrior)
    @health = warrior.health unless @health
    if warrior.health < 14 && warrior.feel.empty? && warrior.health >= @health
      warrior.rest!
    elsif warrior.health < @health && !warrior.feel.empty?
      warrior.attack!
    elsif warrior.feel.empty?
      warrior.walk!
    else
      warrior.attack!
    end
    @health = warrior.health
  end
end
