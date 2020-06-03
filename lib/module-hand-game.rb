module Hand
  HIFUMI  = 'ヒフミ'
  MENASHI = '目なし'
  SHIGORO  = 'シゴロ'
  ZOROME = 'ゾロ目'
  NORMAL = ['','通常の目(1)','通常の目(2)','通常の目(3)','通常の目(4)','通常の目(5)','通常の目(6)']
  PINZORO = 'ピンゾロ'

  STRENGTH_RANK = [
    HIFUMI,MENASHI,
    NORMAL[1],NORMAL[2],NORMAL[3],
    NORMAL[4],NORMAL[5],NORMAL[6],
    SHIGORO,ZOROME,PINZORO
  ]
end
module Match
  WIN  = '勝ち'
  LOSE = '負け'
  DRAW  = '引き分け'
end