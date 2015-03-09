require 'pry'
require 'pry-nav'

def calculator(money)
@money = money
@bottles_to_trade = 0
@caps_to_trade = 0
@total_bottles_traded = 0

bottles_bought = (money.to_i / 2).floor
@bottles_to_trade += bottles_bought
@caps_to_trade += bottles_bought
  
  until @bottles_to_trade < 2 && @caps_to_trade < 4

    bottles_back_for_bottles = (@bottles_to_trade / 2).floor
    @bottles_to_trade -= @bottles_to_trade
    @total_bottles_traded += bottles_back_for_bottles
    @bottles_to_trade += (bottles_back_for_bottles + @bottles_to_trade % 2)
    @caps_to_trade += (bottles_back_for_bottles + @bottles_to_trade % 2)
    bottles_back_for_caps = (@caps_to_trade / 4).floor
    @caps_to_trade -= @caps_to_trade
    @total_bottles_traded += bottles_back_for_caps
    @caps_to_trade += (bottles_back_for_caps + @caps_to_trade % 4)
    @bottles_to_trade += (bottles_back_for_caps + @caps_to_trade % 4)

  end

    puts "For $#{@money} you can trade in #{@total_bottles_traded} bottles."

  if @bottles_to_trade == 1 && @caps_to_trade == 1
    puts "You have one bottle and one cap left over."
  elsif @bottles_to_trade == 1
    puts "You have one bottle and #{@caps_to_trade} caps left over."
  else
    puts "You have #{@bottles_to_trade} bottles and #{@caps_to_trade} caps left over."
  end

end

puts "How much money do you want to spend on bottles of pop?"
calculator(gets.chomp)

