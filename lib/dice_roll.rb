def roll_dice(eye_on_the_dices) 
  eye_on_the_dices.sort!
  dice_hand = '目なし'

  if eye_on_the_dices == [1,1,1] 
      dice_hand = 'ピンゾロ'
  elsif eye_on_the_dices == [1,2,3]
      dice_hand = 'ヒフミ'
  elsif eye_on_the_dices == [4,5,6] 
      dice_hand = 'シゴロ'
  elsif eye_on_the_dices.uniq.size == 1
      dice_hand = 'ゾロ目'
  elsif eye_on_the_dices.uniq.size == 2
        
    group_eye_dices = eye_on_the_dices.group_by{|value|value} 
    #ハッシュ形式で整形する　 ex. group_eye ={2=>[2,2], 5=>[5]}

    uniq_array = group_eye_dices.select{|key,value| value.size == 1}
    #重複していない要素のみを取り出す ex. uniq_array ={5=>[5]}
    
    uniq_value = uniq_array.values.flatten.first
    #取り出した要素を抽出 ex. uniq_array ={5=>[5]}

    dice_hand = "通常の目(#{uniq_value.to_s})"
  else 
    dice_hand = '目なし'
  end
    
    dice_hand
end
