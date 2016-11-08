Feature: User Authentication with Devise
  As a user of da-tong
  so that I can sign in and sign up
  I should be able to sign up for an account or sign into an account that
  already exists

  Scenario: Seeing Sign Up/Sign In buttons
    Given I am on the home page
    Then I should see Sign Up
    And I should see Sign In
    And I should not see Log Out

  Scenario: Seeing a Log Out button
    Given I am logged in
    Then I should see Log Out
    And I should not see Sign Up
    And I should not see Sign In

  Scenario: Signing up for an account
    Given I am on the home page
    When I follow Sign Up
    Then I should see Sign up for Datong
    When I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2"
    And I fill in "user_password_confirmation" with "hunter2"
    And I press "Sign Up"
    Then I should see Welcome! You have signed up successfully.

  Scenario: Signing up with existing email
    Given I have an account for datongtest@datong.berkeley.edu
    And I am on the home page
    And I follow Sign Up
    When I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2"
    And I fill in "user_password_confirmation" with "hunter2"
    And I press "Sign Up"
    Then I should see Email has already been taken

  Scenario: Signing in to an existing account
    Given I have an account for datongtest@datong.berkeley.edu
    And I am on the home page
    And I follow Sign In
    When I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2"
   And I press "Log In"
    Then I should see Signed in successfully


  Scenario: Signing in with an incorrect password
    Given I have an account for datongtest@datong.berkeley.edu
    And I am on the home page
    When I follow Sign In
    And I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2wrong"
    And I press "Log In"
    Then I should see Invalid Email or password

  Scenario: Signing in with a nonexisting email
    Given I am on the home page
    And I follow Sign In
    When I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2"
    And I press "Log In"
    Then I should see Invalid Email or password

  Scenario: Signing out
    Given I am logged in
    And I follow Log Out
    Then I should see Sign Up
    And I should see Sign In
    And I should see Signed out successfully.

  Scenario: Creating an account with a Berkeley email
    Given I am on the home page
    And I follow Sign Up
    When I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2"
    And I press "Sign Up"
    Then I should see Welcome! You have signed up successfully.
    And I should be a Berkeley student
    And I should not be Admin

  Scenario: Creating an account with a non-Berkeley email
    Given I am on the home page
    And I follow Sign Up
    When I fill in "user_email" with "datongtest@sdfsdf.com"
    And I fill in "user_password" with "hunter2"
    And I press "Sign Up"
    Then I should see Welcome! You have signed up successfully.
    And I should not be a Berkeley student 
    And I should not be Admin

 Scenario: Upgrading an account to Admin
    Given I am logged in as Admin
    And I visit 
