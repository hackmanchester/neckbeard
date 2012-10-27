When /^I start an mositrail$/ do
  visit '/mostitrail/start'
end

Then /^the application will present the first clue$/ do
  page.should have_content("Let's find your first exhibit"
end

And /^the ability to provide an exhibit code$/ do
  pending # express the regexp above with the code you wish you had
end