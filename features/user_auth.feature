Feature: User Authentication with Devise
    As a user of da-tong
    so that I can sign in and sign up
    I should be able to sign up for an account or sign into an account that
    already exists
    
Scenario: Seeing Sign Up/Sign In buttons
  Given I am not logged in
  Then I should see a Sign Up button
  And I should see a Sign In button

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
    And I click on Submit
    Then I should see Email has already been taken

Scenario: Signing in to an existing account
  Given I have an account
  And I click on Sign In
  When I fill in the email field with datongtest@datong.berkeley.edu
  And I fill in the password field with hunter2
  And I click on Submit
  Then I should see Signed in successfully
  
  
Scenario: Signing in with an incorrect password
  Given I have an account
  And I click on Sign In
  When I fill in the email field with datongtest@datong.berkeley.edu
  And I fill in the password field with hunter22
  And I click on Submit
  Then I should see Invalid Email or password

