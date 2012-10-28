
module KnowsMe
  def me 
    User.find(1)
  end
end
World(KnowsMe)

Given /^the following exhibits exist within mosi:$/ do |exhibits|
  exhibits.hashes.each do | exhibit |
  	new_exhibit = Exhibit.new
    new_exhibit.title = exhibit[:Title]
    
    new_exhibit.clue = exhibit[:Clue]
    
    new_exhibit.pin = exhibit[:PIN]
    
    new_exhibit.sequence = exhibit[:Sequence]
    
    new_exhibit.save
  end
  FactoryGirl.create(:user)
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

When /^I chooose to skip$/ do
  click_button "Skip"
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

Then /^the application will inform me that I skipped an exhibit$/ do
  page.should have_content("Previous exhibit skipped.")
end


Then /^increments the score$/ do  
  me.score.should eq(1)
end

Then /^does not increment the score$/ do
  me.score.should eq(0)
end