Feature: When I visit the "Past Events" tab, I should be able to see events that have already occurred.
  I should not see events that are currently in progress.

  Background:
    Given I am on the past events page

  Scenario: visiting the page
    Then I should see the nav bar
    And I should see Past Events
    And I should see Date and time
    And I should see Event title
    And I should see Event description

  Scenario: creating an event, happy path
    Then I should see Add Past Event
    And I follow Add Past Event
    And I should see New Event
    And I fill in "past_event_title" with "Spring BBQ"
    Then the "past_event_title" field should contain "Spring BBQ"
    And I fill in "past_event_description" with "Come join us for a BBQ!"
    And I fill in "past_event_date_and_time" with "01/07/2016 09:17AM"
    And I press "Create Event"
    And I should see Event created
    And I should see Spring BBQ

  Scenario: creating event but cancelling, not saving
#    Given I am an admin
    When I follow Add Past Event
    Then I should see New Event
    When I fill in "past_event_title" with "Old BBQ"
    And I fill in "past_event_description" with "Meet our core members at our summer bbq!"
    And I follow Cancel
    Then I should see Past Events
    And I should not see Old BBQ

  Scenario: creating event with blank fields
#    Given I am an admin
    When I follow Add Past Event
    Then I should see New Event
    When I press "Create Event"
    Then I should see Event creation failed
    And I should see New Event

  Scenario: creating event with invalid date
#    Given I am an admin
    When I follow Add Past Event
    Then I should see New Event
    When I fill in "past_event_title" with "Yet another BBQ"
    And I fill in "past_event_description" with "Thank you come again"
    And I fill in "past_event_date_and_time" with "32/05/1969"
    And I press "Create Event"
    Then I should see Event creation failed

  Scenario: editing an event, happy path
#    Given I am an admin
    Then I should see Past Events
    And I follow Add Past Event
    And I should see New Event
    And I fill in "past_event_title" with "Spring BBQ"
    Then the "past_event_title" field should contain "Spring BBQ"
    And I fill in "past_event_description" with "Come join us for a BBQ!"
    And I fill in "past_event_date_and_time" with "01/07/2016 09:17AM"
    And I press "Create Event"
    And I should see Edit
    When I follow Edit
    Then I should see Edit Event
    When I fill in "past_event_date_and_time" with "25/05/1987 09:17AM"
    And I press "Update Event"
    Then I should see Event updated

  Scenario: editing an event, cancelling
#    Given I am an admin
    Then I should see Past Events
    And I follow Add Past Event
    And I should see New Event
    And I fill in "past_event_title" with "Spring BBQ"
    Then the "past_event_title" field should contain "Spring BBQ"
    And I fill in "past_event_description" with "Come join us for a BBQ!"
    And I fill in "past_event_date_and_time" with "01/07/2016 09:17AM"
    And I press "Create Event"
    Then I should see Past Events
    And I should see Edit
    When I follow Edit
    Then I should see Edit Event
    When I fill in "past_event_date_and_time" with "12/04/1987 12:00PM"
    And I follow Cancel
    Then I should see Past Events
    When I follow Edit
    Then I should see 2016-07-01 09:17:00

  Scenario: editing an event, invalid date
#    Given I am an admin
    Then I should see Past Events
    And I follow Add Past Event
    And I should see New Event
    And I fill in "past_event_title" with "Spring BBQ"
    Then the "past_event_title" field should contain "Spring BBQ"
    And I fill in "past_event_description" with "Come join us for a BBQ!"
    And I fill in "past_event_date_and_time" with "01/07/2016 09:17AM"
    And I press "Create Event"
    Then I should see Past Events
    And I should see Edit
    When I follow Edit
    When I fill in "past_event_date_and_time" with "21/20/2200 09:17AM"
    And I press "Update Event"
    Then I should see Missing or invalid required field(s)

  Scenario: deleting an event
#    Given I am an admin
    Then I should see Past Events
    And I follow Add Past Event
    And I should see New Event
    And I fill in "past_event_title" with "Spring BBQ"
    Then the "past_event_title" field should contain "Spring BBQ"
    And I fill in "past_event_description" with "Come join us for a BBQ!"
    And I fill in "past_event_date_and_time" with "01/07/2016 09:17AM"
    And I press "Create Event"
    Then I should see Past Events
    And I should see Edit
    When I follow Edit
    And I follow Delete
    Then I should see Event deleted
    And I should see Past Events
    And I should not see Spring BBQ

