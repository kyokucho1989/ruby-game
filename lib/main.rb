require './lib/player_class'
require './lib/dealer_class'
require './lib/game_class'
require './lib/message'
# チンチロ　ゲームの流れ

# プレイヤー作成

player_A = Player.new(money: 1000, name: 'カイジ')
player_B = Dealer.new(money: 1000, name: '班長')
show_money(player_A,player_B)
puts '---チンチロゲーム---'
loop do

  # 掛け金の設定（相手）

  player_B.set_bet_money

  # 掛け金の設定（自分）
  is_input_exit = player_A.set_bet_money

  break if is_input_exit

  # 賭け金の表示
  show_status(player_A,player_B)


  # サイコロを振る
  player_A.roll_dice
  player_B.roll_dice

  # 出た目の確認・役の決定

  show_hands(player_A,player_B)
 
  # 勝敗判定
  win_or_lose = Game.check_win_lose(player_A,player_B)
  
  # 掛け金の移動
  move_money = Game.return_reward(player_A, player_B,win_or_lose)
  show_result(player_A, player_B,win_or_lose,move_money)
  
  player_A.money += move_money
  player_B.money -= move_money

  show_money(player_A,player_B)

  # 所持金チェック 両者とも0じゃないならループする
  exists_money = Game.confirm_money(player_A, player_B)
   #　ゲーム終了
  break if !exists_money

  # 勝敗がつくまでループ
end