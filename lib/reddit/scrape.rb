require 'nokogiri' 
require 'open-uri'

class Scrape

	def initialize
		puts "hi"
		subreddit("http://www.reddit.com")
	end

	def subreddit(url)
		puts url
		page = Nokogiri::HTML(open(url))
		results = page.css(".linklisting .link")
		results.each do |r|
			url = r.css(".title a")[0]['href']
			title =  r.css(".title .title").text
			score = r.css(".score")
			score = score.css(".unvoted").text.to_i
			comments = r.css(".comments").text.to_i

			post = {url: url, title: title, score: score, comments: comments}
			@posts = [] 
			@posts << post
			puts @posts.inspect

			puts "title:"
			puts title
			puts "score:"
			puts score
			puts "comments:"
			puts comments
			puts "url:"
			puts url
			puts "********************"
		end
		puts @posts.inspect
	end
end
scrape = Scrape.new
scrape

