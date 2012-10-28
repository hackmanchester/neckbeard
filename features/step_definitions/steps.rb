
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
  
end

When /^I register as Williams$/ do
  visit '/mositrail/welcome'
  fill_in 'name', :with => 'Williams'
  click_button 'Register'
end

Then /^I will be presented with the list of trails$/ do
  page.should have_content('Select MOSI Trail')
end

Given /^I have registered$/ do
  FactoryGirl.create(:user)
end





Given /^the following trails exist$/ do |trails_table|
  trails_table.hashes.each do | trail |
    new_trail = Trail.new
    new_trail.name = trail[:name]
    new_trail.save
  end
end

When /^I view the list of trails$/ do
  visit '/mositrail/pick_trail'
end

Then /^I should see Science$/ do

end

Then /^I should see Industry$/ do
end

Then /^I will be registered$/ do
  User.find(:all, :conditions ["name='Williams'"]).count.should eq(1)
end

@wip
When /^I register as \[Blank\]$/ do
  visit '/mositrail/welcome'
  fill_in 'name', :with => ''
  click_button 'Register'
end

Then /^I will not be presented with the list of trails$/ do
  page.should have_no_content "Select MOSI Trail"
end

And /^I will be given an error$/ do
  page.should have_content('ERROR')
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

@wip
When /^I submit the PIN: (.*)$/ do |pin|
  fill_in("PIN", :with => pin)
  click_button "Try"
end

@wip
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
