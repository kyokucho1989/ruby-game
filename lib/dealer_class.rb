require './lib/module-hand-game'
require './lib/character'
class Dealer < Character
  def set_bet_money()
    @bet_money = @money * rand(80..100) /100
  end
end