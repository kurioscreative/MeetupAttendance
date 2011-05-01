Given /^I have upcoming events$/ do |event_data|
  # table is a Cucumber::Ast::Table
  pending
end

Given /^I have an event named "([^"]*)"$/ do |name|
  @event = Factory.build(:event, :name => name)
end

Given /^the event has meetup user named "([^"]*)"$/ do |name|
  pending
end
