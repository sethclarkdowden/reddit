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
 		form = page.forms[15]
 		puts form.inspect
 		button = form.button_with(:type => "submit")
 		form['text'] = "hello world"
 		form.click_button(button) 		
 	end
 	
	def login
		page = @agent.get("http://www.reddit.com/r/funny/comments/18o2rm/whenever_the_waiter_comes_back_to_see_how_the/")
		form = page.forms[1]
		form.user = "STRMX"
		form.passwd = "cascada15"
		@agent.submit(form)
	end

end

p = Login.new