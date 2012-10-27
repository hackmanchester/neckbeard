
 

Given /^the following exhibits exist within mosi:$/ do |exhibits|
  exhibits.hashes.each do | exhibit |
  	new_exhibit = Exhibit.new
    new_exhibit.title = exhibit[:Title]
    
    new_exhibit.clue = exhibit[:Clue]
    
    new_exhibit.pin = exhibit[:PIN]
    
    new_exhibit.sequence = exhibit[:Sequence]
    
    new_exhibit.save
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


When /^I submit the PIN: (.*)$/ do |pin|
  fill_in("PIN", :with => pin)
  click_button "Try"
end


Given /^I have been presented with: (\d+)$/ do |id|
  visit "/mositrail/show/#{id}"
end

Then /^the application will inform me of incorrect pin$/ do
  page.should have_content("Incorrect pin, please try again!!")
end

Then /^the ability to alter my exhibit code$/ do
  page.should have_field("Enter your guess PIN", :value => "sdfsda")
end


Then /^the application will end the mositrail\.$/ do
  page.should have_content("Congratulations, you have finished this MOSI Trail")
end
