Given /^I have a group named "([^"]*)"$/ do |name|
  Group.create!(:group_urlname => name)
end
