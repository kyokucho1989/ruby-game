class Player
  attr_reader :name
  attr_accessor :money,:bet_money,:hand
  def initialize(**params)
    @name = params[:name]
    @money = params[:money]
    @bet_money = params[:bet_money]
    @hand = params[:hand]
  end

  def check_win_lose(opponent)

    strength_relationship = [
      'ヒフミ','目なし',
      '通常の目(1)','通常の目(2)','通常の目(3)',
      '通常の目(4)','通常の目(5)','通常の目(6)',
      'シゴロ','ゾロ目','ピンゾロ'
    ]
    my_hand_rank = strength_relationship.index(@hand)
    opponent_hand_rank = strength_relationship.index(opponent.hand)
    puts '勝敗...'
    if(my_hand_rank > opponent_hand_rank)
      puts '勝ち'
      '勝ち' 
     elsif(my_hand_rank == opponent_hand_rank)
      '引き分け'
     else
       '負け'
     end
  end

  def transfer_money(opponent,win_or_lose)
  
    strength_relationship = [
      'ヒフミ','目なし',
      '通常の目(1)','通常の目(2)','通常の目(3)',
      '通常の目(4)','通常の目(5)','通常の目(6)',
      'シゴロ','ゾロ目','ピンゾロ'
    ]
    dividend_table = [
      -2,-1,
      1,1,1,
      1,1,1,
      2,3,5
    ]
    my_hand_rank = strength_relationship.index(@hand)
    opponent_hand_rank = strength_relationship.index(opponent.hand)
    my_dividend_ratio = dividend_table[my_hand_rank]
    opponent_dividend_ratio = dividend_table[opponent_hand_rank]
    move_money = 0
    if @hand == 'ヒフミ' || opponent.hand == 'ヒフミ' then
      if @hand == 'ヒフミ' && (opponent.hand != 'シゴロ' && opponent.hand != 'ゾロ目' && opponent.hand != 'ピンゾロ') then
        opponent_dividend_ratio = 2
      end
      if @hand == '目なし' && (opponent.hand == 'ヒフミ') then
        my_dividend_ratio = 2
      end
      if (@hand != 'シゴロ' && @hand != 'ゾロ目' && @hand != 'ピンゾロ') && opponent.hand  == 'ヒフミ' then
        opponent_dividend_ratio = 2
        my_dividend_ratio = 2
      end
    end
    
    case win_or_lose
    when '勝ち'
      move_money = my_dividend_ratio * @bet_money
      if move_money < 0 
        move_money = 0
      end
    when '引き分け'
      move_money = 0
    when '負け'
      move_money = - opponent_dividend_ratio * opponent.bet_money
      if move_money > 0 
        move_money = 0
      end
    end

    puts <<~TEXT
    自分： #{@hand} / 相手： #{opponent.hand} / #{win_or_lose} ... #{move_money}ペリカ
    TEXT
    move_money

  end
end