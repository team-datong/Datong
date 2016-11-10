Feature: When I visit the "Past Events" tab, I should be able to see events that have already occurred.
  I should not see events that are currently in progress.

  Scenario: visiting the page
    Given I am on the past events page
    Then I should see the nav bar
    And I should see Past Events