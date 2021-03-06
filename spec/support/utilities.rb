include ApplicationHelper

def full_title(page_title)
	base_title = "Ruby on Rails Tutorial Sample App"
	if page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}"
	end
end

def valid_signin(user)
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	click_button "Sign in"
end


RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: message)
	end
end

RSpec::Matchers.define :have_success_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-success', text: message)
	end
end
RSpec::Matchers.define :have_full_title do |page_title|
	match do |page|
		page.should have_selector('title', text: full_title(page_title))
end
end
RSpec::Matchers.define :have_header do |header|
	match do |page|
		page. should have_selector('h1', text: header)
	end
	
end
