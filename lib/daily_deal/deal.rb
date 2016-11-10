class DailyDeal::Deal
  attr_accessor :name, :price, :availability, :url

	def self.today
		#It shoiuld return a bunch of instances of Deal
		#Scrape woot and meh and then return deals based on that date
		
		self.scrape_deals
	end

	def self.scrape_deals
		deals = []
    deals << self.scrape_woot
    # deals << self.scrape_meh
		deals
	end
  
  def self.scrape_woot
  	#Go to whoo find the product 
    #Extract the properties
    #Instantiate a deal
    page = Nokogiri::HTML(open("http://www.woot.com"))

    deal = self.new
    deal.name = page.search("h2.main-title").text
    deal.price = page.search("span.price.min").text + " - " + page.search("span.price.max").text
    deal.availability = true
    deal
  end

  def self.scrape_meh
  	#Go to whoo find the product 
    #Extract the properties
    #Instantiate a deal 
  end











end