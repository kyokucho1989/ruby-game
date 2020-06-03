require './lib/player_class'
require './lib/module-hand-game'

# ステータス表示
def show_status(player_A,player_B)
  puts <<~TEXT
    名前： #{player_A.name} 
    　所持金:#{player_A.money} ペリカ
    　賭け金：#{player_A.bet_money} ペリカ
    -
    名前： #{player_B.name} 
    　所持金:#{player_B.money} ペリカ
    　賭け金：#{player_B.bet_money} ペリカ

    press enter
    TEXT
  teisi = gets
end

def show_hands(player_A, player_B)

  puts <<~TEXT
  名前： #{player_A.name} 
  出目  #{player_A.dices}
  　役： #{player_A.hand}
  -
  名前： #{player_B.name}
  出目  #{player_B.dices} 
  　役： #{player_B.hand}

  press enter
  TEXT
  teisi = gets
end