Feature: Permission variances on Resource Page
  As an admin, I want to be able to upload/delete resources
  As a logged in user, I want to be able to download resources
  As a not logged in user, I should not be able to access the resources tab
  
Scenario: Core Member visiting Resources Page
  Given I am a core member
  And I am on the resources page
  Then I should see Upload Resource


Scenario: Logged in user (not a core member) visiting Resources Page
  Given I am logged in
  And I am on the resources page
  Then I should not see Upload Resource
 
Scenario: Non logged in user visiting Resources Page
  Given I am on the resources page
  Then I should see You need to sign in or sign up before continuing.
  And I should not see Download Resource
  And I should see Log in

