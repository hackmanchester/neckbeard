When /^I start an mositrail$/ do
  visit '/mositrail/start'
end

Then /^the application will present the first clue$/ do
  page.should have_content("Let's find your first exhibit")
  page.should have_content("This one will drive you up the wall")
end

And /^the ability to provide an exhibit code$/ do
  have_field("PIN")
end