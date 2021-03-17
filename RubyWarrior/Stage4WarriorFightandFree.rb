
class Player
  # @healing = false
  def play_turn(warrior)
    @health = warrior.health unless @health
    if warrior.feel.captive?
      warrior.rescue!
    elsif warrior.health < 14 && warrior.feel.empty? && warrior.health >= @health
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
