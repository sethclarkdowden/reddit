require 'nokogiri' 
require 'open-uri'
require 'rubygems'
require 'mechanize'

class Login

	def initialize
	    @agent = Mechanize.new do |agent|
	      agent.user_agent_alias = 'Mac Safari'
	      agent.follow_meta_refresh = true
	      agent.redirect_ok = true
	    end
	    login
	   	post
	end

 	def post
 		page = @agent.get("http://www.reddit.com/r/funny/comments/18o2rm/whenever_the_waiter_comes_back_to_see_how_the/")
 		form = page.forms
 		# i = 0 
 		# form.each do |f|
 		# 	puts "*************************************"
 		# 	puts i
 		# 	i += 1 
 		# 	puts f.inspect 
 		# end
 		from = page.froms[15]
 		puts form.inspect
 		from.text = "hello world"
 		@agent.submit(form)
 		
 	end
 	
	def login
		page = @agent.get("http://www.reddit.com/r/funny/comments/18o2rm/whenever_the_waiter_comes_back_to_see_how_the/")
		#puts page.inspect
		form = page.forms[1]
		puts page.forms[1].inspect
		form.user = "STRMX"
		form.passwd = "cascada15"
		@agent.submit(form)
		#puts page.inspect


	end

end

p = Login.new