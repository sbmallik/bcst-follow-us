Given(/^I am on the Home front in Broadcast site$/) do
	visit ui_url('/')
	wait_for_pageload
end

Given(/^The Follow Us module exists$/) do
	expect(page).to have_css('.social-media-primary')
end

Given(/^The "(.*?)" button exists$/) do | media_name |
	expect(page).to have_css(".social-media-#{media_name.downcase.tr(' ','_')}")
end

When(/^I click the "(.*?)" button$/) do | media_name |
	click_page_link(".social-media-#{media_name.downcase.tr(' ','_')}")
end

Then(/^The target site loads in a new window$/) do
	new_window_handler do
		expect(current_url.sub!(/^.*\//,'')).to match $expected_url
	end
end
