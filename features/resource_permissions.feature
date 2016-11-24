Feature: Permission variances on Resource Page
  As an admin, I want to be able to upload/delete resources
  As a logged in user, I want to be able to download resources
  As a not logged in user, I should not be able to access the resources tab
  
Scenario: Core Member visiting Resources Page
  Given I am a core member
  And I am on the resources page
  Then I should see Upload Resource
  And I should see Delete
  And I should see Download Resource

Scenario: Logged in user (not a core member) visiting Resources Page
  Given I am logged in
  And I am not a core member
  And I am on the resources page
  Then I should not see Upload Resource
  And I should not see Delete
  And I should see Download Resource
 
Scenario: Non logged in user visiting Resources Page
  Given I am not logged in
  And I am on the resources page
  Then I should see You do not have access
  And I should not see Download Resource
  And I should see Return to Home
