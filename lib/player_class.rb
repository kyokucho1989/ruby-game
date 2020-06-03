require './lib/module-hand-game'
class Player
  attr_reader :name
  attr_accessor :money, :bet_money, :hand, :dices
  def initialize(**params)
    @name = params[:name]
    @money = params[:money]
    @bet_money = params[:bet_money]
    @hand = params[:hand]
    @dices = params[:dices]
  end

  # def check_win_lose(opponent)

  #   strength_relationship = Hand::STRENGTH_RANK
  #   my_hand_rank = strength_relationship.index(@hand)
  #   opponent_hand_rank = strength_relationship.index(opponent.hand)
  #   puts '勝敗...'
  #   if(my_hand_rank > opponent_hand_rank)
  #     Match::WIN 
  #    elsif(my_hand_rank == opponent_hand_rank)
  #     Match::DRAW
  #    else
  #     Match::LOSE
  #    end
  # end

  # def transfer_money(opponent,win_or_lose)
  
  #   strength_relationship = Hand::STRENGTH_RANK
  #   dividend_table = [
  #     -2,-1,
  #     1,1,1,
  #     1,1,1,
  #     2,3,5
  #   ]
  #   my_hand_rank = strength_relationship.index(@hand)
  #   opponent_hand_rank = strength_relationship.index(opponent.hand)
  #   my_dividend_ratio = dividend_table[my_hand_rank]
  #   opponent_dividend_ratio = dividend_table[opponent_hand_rank]
  #   move_money = 0
    
  #   if @hand == Hand::HIFUMI || opponent.hand == Hand::HIFUMI then
  #     if @hand == Hand::HIFUMI && (opponent.hand != Hand::SHIGORO && opponent.hand != Hand::ZOROME && opponent.hand != Hand::PINZORO) then
  #       opponent_dividend_ratio = 2
  #     end
  #     if @hand == Hand::MENASHI && (opponent.hand == Hand::HIFUMI) then
  #       my_dividend_ratio = 2
  #     end
  #     if (@hand != Hand::SHIGORO && @hand != Hand::ZOROME && @hand != Hand::PINZORO) && opponent.hand  == Hand::HIFUMI then
  #       opponent_dividend_ratio = 2
  #       my_dividend_ratio = 2
  #     end
  #   end
    
  #   case win_or_lose
  #   when Match::WIN 
  #     move_money = my_dividend_ratio * @bet_money
  #     if move_money < 0 
  #       move_money = 0
  #     end
  #   when Match::DRAW
  #     move_money = 0
  #   when Match::LOSE
  #     move_money = - opponent_dividend_ratio * opponent.bet_money
  #     if move_money > 0 
  #       move_money = 0
  #     end
  #   end

  #   puts <<~TEXT
  #   自分： #{@hand} / 相手： #{opponent.hand} / #{win_or_lose} ... #{move_money}ペリカ
  #   TEXT
  #   move_money

  # end
end