require './lib/module-hand-game'
class Game
  def initialize(**params)

  end

  def check_win_lose(player_A,opponent)

    strength_relationship = Hand::STRENGTH_RANK
    my_hand_rank = strength_relationship.index(player_A.hand)
    opponent_hand_rank = strength_relationship.index(opponent.hand)
    puts '勝敗...'
    if(my_hand_rank > opponent_hand_rank)
      Match::WIN 
     elsif(my_hand_rank == opponent_hand_rank)
      Match::DRAW
     else
      Match::LOSE
     end
  end

  def transfer_money(player_A,opponent,win_or_lose)
    my_hand = player_A.hand
    my_bet_money = player_A.bet_money
    strength_relationship = Hand::STRENGTH_RANK
    dividend_table = [
      -2,-1,
      1,1,1,
      1,1,1,
      2,3,5
    ]
    my_hand_rank = strength_relationship.index(my_hand)
    opponent_hand_rank = strength_relationship.index(opponent.hand)
    my_dividend_ratio = dividend_table[my_hand_rank]
    opponent_dividend_ratio = dividend_table[opponent_hand_rank]
    move_money = 0
    
    if my_hand == Hand::HIFUMI || opponent.hand == Hand::HIFUMI then
      if my_hand == Hand::HIFUMI && (opponent.hand != Hand::SHIGORO && opponent.hand != Hand::ZOROME && opponent.hand != Hand::PINZORO) then
        opponent_dividend_ratio = 2
      end
      if my_hand == Hand::MENASHI && (opponent.hand == Hand::HIFUMI) then
        my_dividend_ratio = 2
      end
      if (my_hand != Hand::SHIGORO && my_hand != Hand::ZOROME && my_hand != Hand::PINZORO) && opponent.hand  == Hand::HIFUMI then
        opponent_dividend_ratio = 2
        my_dividend_ratio = 2
      end
    end
    
    case win_or_lose
    when Match::WIN 
      move_money = my_dividend_ratio * my_bet_money
      if move_money < 0 
        move_money = 0
      end
    when Match::DRAW
      move_money = 0
    when Match::LOSE
      move_money = - opponent_dividend_ratio * opponent.bet_money
      if move_money > 0 
        move_money = 0
      end
    end

    puts <<~TEXT
    自分： #{my_hand} / 相手： #{opponent.hand} / #{win_or_lose} ... #{move_money}ペリカ
    TEXT
    move_money

  end
end