require 'nokogiri' 
require 'open-uri'

class Subreddit

	def initialize()
		@posts =[]
	end

	def scraper(subb, pages)
		@url = "http://www.reddit.com/r/" + subb
		count = 1
		pages = pages.to_i

		while count <= pages
			scrape
			getnexturl
			count += 1
			sleep(5 + rand(15))

		end
		return @posts
	end

	def getnexturl()
		urlchek = @page.css(".nextprev a")
		urlchek = urlchek.map {|urlchek| urlchek.attribute('href')}
		if urlchek[1] == nil
			@url = urlchek[0]
		else
			@url = urlchek[1]
		end
	end


	def scrape()
		@page = Nokogiri::HTML(open(@url))
		results = @page.css(".linklisting .link")
		results.each do |r|
			urls = r.css(".title a")[0]['href']
			title =  r.css(".title .title").text
			score = r.css(".score")
			score = score.css(".unvoted").text.to_i
			comments = r.css(".comments").text.to_i

			post = {url: urls, title: title, score: score, comments: comments}
			@posts << post

			puts "title:"
			puts title
			puts "score:"
			puts score
			puts "comments:"
			puts comments
			puts "url:"
			puts urls
			puts "********************"
		end
	end
end

puts "subreddit:"
subb = gets.chomp
puts "pages:"
pages = gets.chomp

s = Subreddit.new
posts = s.scraper(subb, pages)
		posts.each do |p|
			puts p.inspect
			puts "*****************************"
		end

