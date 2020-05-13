require 'minitest/autorun'
require './lib/transfer_money'
class DiceTest < Minitest::Test
  def test_transfer_money
    roll_map = [
      'ヒフミ','目なし',
      '通常の目(1)','通常の目(2)','通常の目(3)',
      '通常の目(4)','通常の目(5)','通常の目(6)',
      'シゴロ','ゾロ目','ピンゾロ'
    ]
    win_lose_map = [
      ['引き分け','負け','負け','負け','負け','負け','負け','負け','負け','負け','負け'],
      ['勝ち','引き分け','負け','負け','負け','負け','負け','負け','負け','負け','負け'],
      ['勝ち','勝ち','引き分け','負け','負け','負け','負け','負け','負け','負け','負け'],
      ['勝ち','勝ち','勝ち','引き分け','負け','負け','負け','負け','負け','負け','負け'],
      ['勝ち','勝ち','勝ち','勝ち','引き分け','負け','負け','負け','負け','負け','負け'],
      ['勝ち','勝ち','勝ち','勝ち','勝ち','引き分け','負け','負け','負け','負け','負け'],
      ['勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','引き分け','負け','負け','負け','負け'],
      ['勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','引き分け','負け','負け','負け'],
      ['勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','引き分け','負け','負け'],
      ['勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','引き分け','負け'],
      ['勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','勝ち','引き分け']
    ]
    
    player_A = Player.new(money:1000,bet_money:100,hand:'目なし',name:'カイジ')
    player_B = Player.new(money:1000,bet_money:100,hand:'目なし',name:'班長')

    roll_map.each_with_index do |value_1,i|
      player_A.hand = value_1
      roll_map.each_with_index do |value_2,j|
        player_B.hand = value_2
        assert_equal , player_A.transfer_money(player_B,win_or_lose_map[i][j])
      end
    end


    assert_equal 0, player_A.transfer_money(player_B,'引き分け')
    assert_equal 0, player_A.transfer_money(player_B,'勝ち')

  end
end