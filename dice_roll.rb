def roll_dice
    #eye_on_the_dices = [rand(1..6),rand(1..6) ,rand(1..6)]
    eye_on_the_dices = [2,2,2]
    # p eye_on_the_dices
    eye_on_the_dices.sort!
    if eye_on_the_dices === [1,1,1] then
        puts "ピンゾロです"
    end
    if eye_on_the_dices.uniq.size == 1 then
        puts "ぞろ目です"
    end
    return eye_on_the_dices
end

p roll_dice