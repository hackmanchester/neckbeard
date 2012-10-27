class Exhibit
  attr_accessor :title
end
 

Given /^the following exhibits exist within mosi:$/ do |exhibits|
  exhibits.hashes.each do | exhibit |
  	new_exhibit = Exhibit.new
  	new_exhibit.title = exhibit

  end
end

When /^I start an mositrail$/ do
  visit '/mositrail/start'
end

Then /^the application will present the clue: (.*)$/ do | clue |
  page.should have_content(clue)
end



And /^the ability to provide an exhibit code$/ do
  page.should have_field("Enter your guess PIN")
end


When /^I submit the PIN: MOSI(\d+)$/ do |pin|
  fill_in("PIN", :with => pin)
  click_button "Try"
end


Given /^I have been presented with: (\d+)$/ do |id|
  visit "/mositrail/show/#{id}"
end