dices = []
3.times{
 dices << (1..6).to_a.sample
}
p dices
dic = Hash.new(0)
dices.each{|x|
 dic[x] += 1
}
p dic
dic=dic.sort{|x,y| x[1]<=>y[1]}
p dic
output = ""
output << dic[0][0] if dic.size<3
output << " ゾロ" if dic.size==1 
output << " の目" if dic.size==2
output << "目無し" if dic.size==3

