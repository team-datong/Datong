Feature: When I visit the events page, I should see all the events
  Whenever I visit the events page
  I should see a calendar of new events
  When I visit the events page
  And I am logged in
  I should also be able to add/delete events

  Background:
    Given I am an event admin
    And I am on the events page
    When I follow New Event
    Then I should see New Event
    When I fill in "Title" with "Test Event"
    And I press "Create Event"

  Scenario: visiting the events page
    Given I am on the events page
    Then I should see Upcoming Events
    And the page should have a div#calendar element

  Scenario: Creating a new event
    Given I am on the events page
    When I follow New Event
    Then I should see New Event
    When I fill in "Title" with "Test Event 2"
    And I press "Create Event"
    Then I should see Test Event 2

  Scenario: Creating a new event incorrectly
    Given I am on the events page
    When I follow New Event
    Then I should see New Event
    When I fill in "Title" with ""
    And I press "Create Event"
    Then I should see error

  Scenario: Editing an existing event correctly
    Given I'm on the edit page for Test Event
    Then I should see Editing Event
    And I fill in "Title" with "Updated Test Event"
    And I press "Update Event"
    Then I should see Updated Test Event


  Scenario: Editing an existing event incorrectly
    Given I'm on the edit page for Test Event
    Then I should see Editing Event
    And I fill in "Title" with ""
    And I press "Update Event"
    Then I should see error


  Scenario: Deleting an existing event
    Given I am on the events page
    When I follow Destroy
    Then I should not see Test Event



