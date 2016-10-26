Feature: User Authentication with Devise
    As a user of da-tong
    so that I can sign in and sign up
    I should be able to sign up for an account or sign into an account that
    already exists
    
Scenario: Seeing Sign Up/Sign In buttons
  Given I am not logged in
  Then I should see Sign Up
  And I should see Sign In

Scenario: Seeing a Log Out button
  Given I am logged in
  Then I should see Log out

Scenario: Signing up for an account
    Given I do not have an account
    And I follow signup
    Then I should see Sign up for Datong
    When I fill in email with datongtest@datong.berkeley.edu
    And I fill in password with hunter2
    And I press Submit
    Then I should see Welcome! You have signed up successfully.

Scenario: Signing up with existing email
    Given I have an account for datongtest@datong.berkeley.edu
    And I follow signup
    When I fill in email with datongtest@datong.berkeley.edu
    And I fill in password with hunter2
    And I press Submit
    Then I should see Email has already been taken

Scenario: Signing in to an existing account
  Given I have an account for datongtest@datong.berkeley.edu
  And I follow Sign In
  When I fill in email with datongtest@datong.berkeley.edu
  And I fill in password with hunter2
  And I press Submit
  Then I should see Signed in successfully
  
  
Scenario: Signing in with an incorrect password
  Given I have an account
  And I follow Sign In
  When I fill in email with datongtest@datong.berkeley.edu
  And I fill in password with hunter22
  And I press Submit
  Then I should see Invalid Email or password
  
# Scenario: Signing up with an invalid email
#   Given I am not logged in
#   And I follow Sign up
#   When I fill in the email field with asdf@asdf.com
#   And I fill in the password field with hunter2
#   And I press Submit
#   Then I should see Not a valid email

