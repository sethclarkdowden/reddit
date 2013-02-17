require 'nokogiri' 
require 'open-uri'

class Post
	attr_accessor :comment

	def initialize(url)
		url = "http://www.reddit.com/r/pics/comments/18ndmv/my_moms_a_vet_and_today_my_wife_and_i_got_the/"
		scrape(url)
	end

	def scrape(url)
		page = Nokogiri::HTML(open(url))
		title = page.css(".linklisting .title a")
		title = title.css(".title").text
		@comment = page.css(".entry .noncollapsed .usertext")[0].text
	end
end

p = Post.new("http://www.reddit.com/r/pics/comments/18ndmv/my_moms_a_vet_and_today_my_wife_and_i_got_the/")
puts p.comment


