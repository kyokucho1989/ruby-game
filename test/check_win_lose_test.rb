require 'minitest/autorun'
require './lib/transfer_money'
class DiceTest < Minitest::Test
  def test_win_lose
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
    
    player_A = Player.new(hand:'目なし',name:'カイジ')
    player_B = Player.new(hand:'目なし',name:'班長')
    roll_map.each_with_index do |value_1,i|
      player_A.hand = value_1
      roll_map.each_with_index do |value_2,j|
        player_B.hand = value_2
        assert_equal win_lose_map[i][j], player_A.check_win_lose(player_B)
      end
    end
    # player_A.hand = roll_map[0]
    # player_B.hand = roll_map[1]
    # #p win_lose_map[0][1]
    # assert_equal win_lose_map[0][1], player_A.check_win_lose(player_B)
  end
end