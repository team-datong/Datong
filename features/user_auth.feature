Feature: User Authentication with Devise
    As a user of da-tong
    so that I can sign in and sign up
    I should be able to sign up for an account or sign into an account that
    already exists

Scenario: Signing up for an account
    Given I don't have an account
    And I click on signup
    Then I should see Sign up for Datong
    When I fill in the email field with datongtest@datong.berkeley.edu
    And I fill in the password field with hunter2
    And I click on submit
    Then I should see Welcome! You have signed up successfully.

Scenario: Signing up with existing email
    Given I have an account
    And I click on signup
    When I fill in the email field with datongtest@datong.berkeley.edu
    And I fill in the password field with hunter2
    And I click on submit
    Then I should see Email has already been taken
