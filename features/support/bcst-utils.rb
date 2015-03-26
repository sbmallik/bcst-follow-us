def new_window_handler
       @original_window = page.driver.browser.window_handles.first
       @new_window = page.driver.browser.window_handles.last
       page.driver.browser.switch_to.window @new_window
       yield
       page.driver.browser.close
       page.driver.browser.switch_to.window @original_window
end

def click_page_link(class_name)
       @page_element = find(class_name)
       $expected_url = @page_element[:href].sub!(/^.*\//,'')
       @page_element.click
end

