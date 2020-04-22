def roll_dice
    eye_on_the_dices = {eye1:rand(1..6), eye2:rand(1..6) ,eye3:rand(1..6)} 
    return eye_on_the_dices
end

puts roll_dice