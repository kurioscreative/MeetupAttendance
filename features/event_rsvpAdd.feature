Feature: Add Event RSVP
  In order to check someone in
  As a person who tracks attendance
  I want to create a new event RSVP for a user
  
  @wip
  Scenario: Checkin New Member
    Given I have a group named "ruby-nuby-info"
    And I have an event named "Ruby Nuby Reboots"
    And I am on the event page
    And the event has meetup user named "John"
    When I press "Check-in"
    Then I should see "Checked In"
    And I should have a new member named "John"
    And "John" should an rsvp for "Ruby Nuby Reboots"
  
  Scenario: Checkin Existing Member
    Given I have a group named "ruby-nuby-info"
    And I have an event named "Ruby Nuby Reboots"
    And I am on the event page
    And the event has meetup user named "John"
    When I press "Check-in"
    Then I should see "Checked In"
    And I should have an updated member named "John"
    And "John" should an rsvp for "Ruby Nuby Reboots"
  
  