#Our CLI controller
class DailyDeal::CLI

  def call
  	list_deals
  	menu
  end

  def list_deals
  	puts "Today's Daily Deals:"
    @deals = DailyDeal::Deal.today
    @deals.each.with_index(1) do |deal, index|
      puts "#{index}. #{deal.name}"
      puts "    price: #{deal.price}" 
      puts "    availability: #{deal.availability}"
    end	
  end	

  def menu
  	input = nil
  	while input != "exit"

	  	puts "Enter the number of deals you'd like more info on, or type list to see the list of protucts again or exit"
	  	input = gets.strip.downcase

	  	if input.to_i > 0
	  		the_deal = @deals[input.to_i-1]
        puts "#   #{the_deal.name}"
        puts "    price: #{the_deal.price}" 
        puts "    availability: #{the_deal.availability}"
	  	elsif input == "list"
	  	 	 list_deals	 	   
	  	else
	  	  puts "Not sure what you want, type list or exit"  					
	  	end	

  	end
  end
  
  def goodbey
  	puts "See you tomorrow for more deals!!!"
  end

end