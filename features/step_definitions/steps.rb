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
	page.should have_content("This one will drive you up the wall")
end



And /^the ability to provide an exhibit code$/ do
  have_field("PIN")
end