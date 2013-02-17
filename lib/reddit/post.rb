require 'nokogiri' 
require 'open-uri'
require 'rubygems'
require 'mechanize'

class Post

	def initialize
		puts "hi"
		post
		
	end

	def subiterator
		posts.each do |p|
			url p{urls}
			
			
		end
	end



	def post
		postpage = Mechanize.new
		postpage = postpage.get("http://www.reddit.com")
		puts postpage.inspect


	end

end

p = Post.new