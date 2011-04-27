Feature: Add a new group

In order to track a group
As a user
I want to add a new meetup group from Meetup.com

Scenario: Add Group
  Given I am on the new group page
  When I fill in "Group URI" with "ruby-nuby-info"
  And I press "Create Group"
  Then I should be on the group page for "ruby-nuby-info"
  And I should see "Ruby Nuby"