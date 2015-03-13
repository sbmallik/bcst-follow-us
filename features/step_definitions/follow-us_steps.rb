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
	@page_element = find(".social-media-#{media_name.downcase.tr(' ','_')}")
	$expected_url = @page_element[:href].sub!(/^.*\//,'')
	@page_element.click
end

Then(/^The target site loads in a new window$/) do
	@original_window = page.driver.browser.window_handles.first
	@new_window = page.driver.browser.window_handles.last
	page.driver.browser.switch_to.window @new_window
	expect(current_url.sub!(/^.*\//,'')).to match $expected_url
	page.driver.browser.close
	page.driver.browser.switch_to.window @original_window
end
