require './lib/module-hand-game'
require './lib/character'
class Player < Character
  def set_bet_money()
    loop do
      puts '掛け金を入力してください （終了するにはexitを入力）'
      bet_money = gets.chomp
      
      if bet_money == "exit"
        puts '終了'
        #true #ゲーム終了
        break true
        #exit
      end
      if bet_money =~ /^[0-9]+$/ 
        if bet_money.to_i > @money
          puts '所持金より多い金額は賭けられません'
        elsif bet_money.to_i == 0
          puts '0は無効です'
        else
          @bet_money = bet_money.to_i
          #false #ゲーム終了しない
          break false
        end
      else
        puts '正の整数で入力してください'
      end
    end  
  end
end