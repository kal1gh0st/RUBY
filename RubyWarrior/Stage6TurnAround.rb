#Stage 6


class Player
  def play_turn(warrior)
    @player_state = 1 unless @player_state
    @health = warrior.health unless @health
    # @player_state = 0 if warrior.feel.empty?
    @player_state = 6 if warrior.feel.wall?
    @player_state = 0 if warrior.feel(:backward).wall?
    @player_state = 0 if @player_state == 2 && warrior.health >= 20
    @player_state = 2 if warrior.health < @health && !warrior.feel.empty?
    @player_state = 1 if @player_state == 2 && @health > warrior.health
    @player_state = 2 if warrior.health < 14 && warrior.feel.empty? && warrior.health >= @health
    @player_state = 5 if warrior.feel(:backward).captive?
    @player_state = 4 if warrior.feel.captive?
    @player_state = 3 if warrior.feel.enemy?


    case @player_state
      when 0
        warrior.walk!
      when 1
        warrior.walk!(:backward)
      when 2
        warrior.rest!
      when 3
        warrior.attack!
      when 4
        warrior.rescue!
        @player_state = 0
      when 5
        warrior.rescue!(:backward)
        @player_state = 0
      when 6
        warrior.pivot!
    end


    @health = warrior.health
  end
end
