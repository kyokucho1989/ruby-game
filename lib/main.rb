require './transfer_money'
require './dice_roll'
# チンチロ　ゲームの流れ

# 親を決める（はじめは班長から）

player_A = Player.new(money:1000,bet_money:100,name:'カイジ')
player_B = Player.new(money:3000,bet_money:300,name:'班長')

loop do
    while true
        puts '掛け金を入力してください'
        bet_money = gets
        if bet_money =~ /^[0-9]+$/
            break
        else
            puts '整数で入力してください'
        end
    end
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
    # 掛け金の設定（自分）

    # 相手は勝手に決める
    # サイコロを振る
    eye_on_the_dices1 = [rand(1..6),rand(1..6),rand(1..6)]
    eye_on_the_dices2 = [rand(1..6),rand(1..6),rand(1..6)]
    player_A.hand = roll_dice(eye_on_the_dices1)
    player_B.hand = roll_dice(eye_on_the_dices2)
    # 出た目の確認・役の決定
    puts <<~TEXT
    名前： #{player_A.name} 
    出目  #{eye_on_the_dices1}
    　役： #{player_A.hand}
    -
    名前： #{player_B.name}
    出目  #{eye_on_the_dices2} 
    　役： #{player_B.hand}

    press enter
    TEXT
    teisi = gets
    # 勝敗判定
    win_or_lose = player_A.check_win_lose(player_B)
    # win_or_lose
    # 掛け金の移動
    move_money = player_A.transfer_money(player_B,win_or_lose)
    player_A.money += move_money
    player_B.money -= move_money

    puts <<~TEXT
    名前： #{player_A.name} 
    　所持金:#{player_A.money} ペリカ
    　賭け金：#{player_A.bet_money} ペリカ
    -
    名前： #{player_B.name} 
    　所持金:#{player_B.money} ペリカ
    　賭け金：#{player_B.bet_money} ペリカ
    --------------------------
    TEXT
    if player_A.money <= 0 || player_B.money <= 0
        break
    end
    # 勝敗がつくまでループ
end