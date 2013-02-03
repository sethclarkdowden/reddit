# change = [25, 10, 5, 1]
# puts "input value"
# x = gets.chomp.to_f
# x = x*100
# x.to_i
# change.each do |c|
# y = x / c 
# y = y.to_i
# puts y
# x = x - y * c
# x.round
# end

class CashToChange
	def initialize(amount)
		@hash = {}
		change(amount)
	end
	def get_hash
		@hash
	end
	def change(amount)
		amount = (amount * 100).to_i
		{quarter: 25, dime: 10, nickel: 5, penny: 1}.each do |coin, value|
			count = amount / value
			count = count.to_i
			amount = amount - count * value
			amount.round
			@hash[coin] = count
		end
	end
end
puts "Input value: "
val = gets.chomp.to_f
change = CashToChange.new(val).get_hash

puts change # {:quarters => "4", :dimes => "3", :nickels => "1", :pennies => "2"}