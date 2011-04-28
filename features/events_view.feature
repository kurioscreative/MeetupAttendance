Feature: View Events

In order to select a group to track
As a person who tracks attendance
I want to see upcoming meetups for a group

Background: Upcoming Events
  Given I have upcoming events
    | meetup_id | name                 | status     | description   | time          |
    | 11        | "Ruby Reboot Week 1" | "past"     | "Lorem ipsum" | 1304375400000 |
    | 23        | "Ruby Reboot Week 2" | "upcoming" | "Lorem ipsum" | 1404375400000 |
    | 35        | "Ruby Reboot Week 3" | "upcoming" | "Lorem ipsum" | 1404375400000 |

@wip
Scenario: View upcoming meetups
  Given I have a group named "ruby-nuby-info"
  And I am on the group page for "ruby-nuby-info"
  When I follow "View All Meetups"
  Then I should see "Ruby Reboot Week 1"
  And I should see "Ruby Reboot Week 2"
  And I should see "Ruby Reboot Week 3"
