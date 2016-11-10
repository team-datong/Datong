Feature: When I visit the "Past Events" tab, I should be able to see events that have already occurred.
  I should not see events that are currently in progress.

  Background:
    Given I am on the past events page

  Scenario: visiting the page
    Then I should see the nav bar
    And I should see Past Events
    And I should see Date
    And I should see Event duration
    And I should see Event name
    And I should see Event description
    And I should not see "Save"

  Scenario: creating an event, happy path
    Given I am an admin
    Then I should see Add Event
    When I press "Add Event"
    Then I should see New Event
    When I fill in the following:
    | Event name       | Spring BBQ                               |
    | Event description| Meet our core members at our summer bbq! |
    And I select "May 25, 2016" from "Date"
    And I select "12:00PM" from "Time"
    And I press "Save"
    Then I should see "Success! Past event created!"

  Scenario: creating event but cancelling, not saving
    Given I am an admin
    When I press "Add Event"
    Then I should see New Event
    When I fill in the following:
      | Event name       | Old BBQ                                  |
      | Event description| Meet our core members at our summer bbq! |
    And I select "May 25, 1997" from "Date"
    And I select "12:00PM" from "Time"
    And I press "Cancel"
    Then I should see Past Events
    And I should not see "Old BBQ"

  Scenario: creating event with blank fields
    Given I am an admin
    When I press "Add Event"
    Then I should see New Event
    When I press "Save"
    Then I should see "Error"
    And I should see New Event

  Scenario: creating event with invalid date
    Given I am an admin
    When I press "Add Event"
    Then I should see New Event
    When I fill in the following:
      | Event name       | BBQ                                      |
      | Event description| Meet our core members at our summer bbq! |
    And I select "May 25, 2997" from "Date"
    And I select "12:00PM" from "Time"
    And I press "Save"
    Then I should see "Error"

  Scenario: editing an event, happy path
    Given I am an admin
    Then I should see Past Events
    And I should see Edit
    When I follow Edit
    Then I should see Save
    When I select "May 25, 1987" from "Date"
    And I press "Save"
    Then I should see "Success! Past event edited!"

  Scenario: editing an event, cancelling
    Given I am an admin
    Then I should see Past Events
    And I should see Edit
    When I follow Edit
    Then I should see Save
    When I select "April 12, 1987" from "Date"
    And I press "Cancel"
    Then I should see Past Events
    When I follow Edit
    Then I should see "May 25, 1987"

  Scenario: editing an event, invalid date
    Given I am an admin
    Then I should see Past Events
    And I should see Edit
    When I follow Edit
    Then I should see Save
    When I select "November 20, 2200" from "Date"
    And I press "Save"
    Then I should see "Error"

