require 'nokogiri' 
require 'open-uri'

class Karmadecay


def initialize
	@reposts = []
	puts "init"
	scrape("http://gifsound.com/?gif=http%3A%2F%2F2.bp.blogspot.com%2F-Dr1aT2UQzPc%2FURQPuatnMoI%2FAAAAAAAAbv0%2FPZ260P7RHKI%2Fs1600%2F1.gif&sound=http%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D0IJoKuTlvuM&start=0")
	puts @reposts
end

def scrape(url)
	url = "http://karmadecay.com/" + url
	puts url
	page = Nokogiri::HTML(open(url))
	results = page.css(".result")
	results.each do |r|
		no = r.css(".no")[0].text
		url = r.css(".title a")[0]['href']
		title = r.css(".title a").text
 		votes = r.css(".votes .no").text.to_i
 		comments = r.css(".comments .no").text.to_i
 		similar = r.css(".similar .fr").text


 	#test info ...
	 	if no != nil
	 		if similar.include? "100%"
		 	puts "******************************"
			puts no
			puts title
			puts url
			puts votes
			puts comments
			@reposts << url 
			end
		end	
	end

	
end

end

Karmadecay.new

