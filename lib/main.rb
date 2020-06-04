require './lib/player_dealer_class'
require './lib/game_class'
require './lib/dice_roll'
require './lib/message'
# チンチロ　ゲームの流れ

# 親を決める（はじめは班長から）

player_A = Player.new(money: 1000, name: 'カイジ')
player_B = Dealer.new(money: 1000, name: '班長')
game = Game.new
puts '---チンチロゲーム---'
loop do
  # 掛け金の設定（相手）
    # bet_money_B = player_B.money * rand(80..100) /100
    # player_B.bet_money = player_B.money < bet_money_B ? player_B.money : bet_money_B

  player_B.set_bet_money()

  # 掛け金の設定（自分）
  player_A.set_bet_money()


  show_status(player_A,player_B)


  # サイコロを振る

  player_A_hand_dices = roll_dice()
  player_A.hand = player_A_hand_dices[:hand]
  player_A.dices = player_A_hand_dices[:dices]

  player_B_hand_dices = roll_dice()
  player_B.hand = player_B_hand_dices[:hand]
  player_B.dices= player_B_hand_dices[:dices]
  
  # 出た目の確認・役の決定

  show_hands(player_A,player_B)
 
  # 勝敗判定
  # win_or_lose = player_A.check_win_lose(player_B)
  win_or_lose = game.check_win_lose(player_A,player_B)
  
  # 掛け金の移動
  # move_money = player_A.transfer_money(player_B,win_or_lose)
  move_money = game.transfer_money(player_A, player_B,win_or_lose)
  show_result(player_A, player_B,win_or_lose,move_money)
  
  player_A.money += move_money
  player_B.money -= move_money

  show_money(player_A,player_B)

  if player_A.money <= 0
    puts '所持金ゼロ。負けました…'  
    break
  elsif player_B.money <= 0
    puts '勝ちました！'
    break
  end
  # 勝敗がつくまでループ
end