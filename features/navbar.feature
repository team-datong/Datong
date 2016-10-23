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
  And I should not see "Core Members"
