Feature: When I visit a static page, its content should match its counterpart on datong.berkeley.edu
  As a visitor
  Whenever I visit a static page
  I should be able to see the same as I did in datong.berkeley.edu

Scenario: visiting the home page
  Given I am on the home page
  Then I should see the nav bar
  And I should see About Da-Tong

Scenario: visiting the people page
  Given I am on the people page
  Then I should see the nav bar
  And I should see Core Members

