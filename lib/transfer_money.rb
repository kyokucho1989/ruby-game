


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
    # puts <<~TEXT
    # 自分の役： #{@hand}
    # 相手の役： #{opponent.hand}
    # TEXT
    strength_relationship = [
      'ヒフミ','目なし',
      '通常の目(1)','通常の目(2)','通常の目(3)',
      '通常の目(4)','通常の目(5)','通常の目(6)',
      'シゴロ','ゾロ目','ピンゾロ'
    ]
    my_hand_rank = strength_relationship.index(@hand)
    opponent_hand_rank = strength_relationship.index(opponent.hand)

    if(my_hand_rank > opponent_hand_rank)
       '勝ち' 
     elsif(my_hand_rank == opponent_hand_rank)
       '引き分け'
     else
       '負け'
     end
  end

  def transfer_money(opponent,win_or_lose)

    puts <<~TEXT
    自分の役： #{@hand} / 相手の役： #{opponent.hand}
    TEXT
    
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

    case win_or_lose
    when '勝ち'
      move_money = my_dividend_ratio * bet_money
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

    move_money
    #  # puts '勝ち'
    #   move_money = my_dividend_ratio * bet_money
    #   @money += move_money
    #   opponent.money -= move_money

    # elsif(my_hand_rank == opponent_hand_rank)
    #  # puts '引き分け'
    # else
    #  # puts '負け'
    #   move_money = opponent_dividend_ratio * opponent.bet_money
    #   @money -= move_money
    #   opponent.money += move_money
    # end
  end
end


player_A = Player.new(money:1000,bet_money:100,hand:'目なし',name:'カイジ')
player_B = Player.new(money:1000,bet_money:100,hand:'目なし',name:'班長')

#player_A.bet_money = 300
#player_A.money = 3090
 player_A.hand = '目なし'
 player_B.hand = 'ピンゾロ'
# puts <<~TEXT
# 名前： #{player_A.name}
# 所持金： #{player_A.money}ペリカ
# bet： #{player_A.bet_money}ペリカ
# 役： #{player_A.hand}
# TEXT
# puts <<~TEXT
# 名前： #{player_B.name}
# 所持金： #{player_B.money}ペリカ
# bet： #{player_B.bet_money}ペリカ
# 役： #{player_B.hand}
# TEXT
 #player_A.transfer_money(player_B,'負け')
#p player_A.transfer_money(player_B)
# p player_A.check_win_lose(player_B)

# puts '----------------'
# puts <<TEXT
# 名前： #{player_A.name}
# 所持金： #{player_A.money}ペリカ
# TEXT

# puts <<TEXT
# 名前： #{player_B.name}
# 所持金： #{player_B.money}ペリカ
# TEXT
