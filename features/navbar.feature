Feature: When I visit a page with a navbar, the links should be clickable and lead me to the correct page
  As a visitor,
  Whenever I see a navbar
  I should be able to click on any of the links and be taken to the corresponding page

  Scenario: visiting the home page
    Given I am on the home page
    When I follow People
    Then I should see Core Members

  Scenario: visiting the home page from the people page
    Given I am on the people page
    When I follow Home
    Then I should see About Da-Tong
    And I should not see Core Members

  Scenario: Signing up
    Given I am on the home page
    When I follow Sign Up
    Then I should see Email
    And I should see Password Confirmation
    And I should not see Log Out

  Scenario: Signing in
    Given I am on the home page
    When I follow Sign Up
    Then I should see Email
    And I should see Password
    And I should not see Log Out

  Scenario: Logging out
    Given I am logged in
    Then I should not see Sign Up
    And I should not see Sign In
    And I should see Log Out