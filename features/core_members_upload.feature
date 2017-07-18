Feature: only allow core members to upload
  As a Datong officer, so that I can allow core members to upload files.
  I want core members to have an upload button that registered members do not have.

Scenario: core members can upload and download
  Given I am on the home page
  And I am a core member
  When I follow Resources
  Then I should be on the resources page
  And I should see upload
  And I should see Download Link

Scenario: non-core-members cannot upload but can download
  Given I am on the home page
  And I am a registered member
  And I should not see Resources


Scenario: core member can see and navigate to Resources page with Upload and Download options
  Given I am on the home page
  And I am a core member
  Then I should see Resources
  When I follow Resources
  Then I should be on the resources page
  Then I should see upload
  And I should see Download Link

Scenario: event admin can see and navigate to Resources page without Upload and with Download options
  Given I am on the home page
  And I am an event admin
  Then I should see Resources
  When I follow Resources
  Then I should be on the resources page
  Then I should not see upload
  And I should see Download Link

Scenario: account admin can see and navigate to Resources page without Upload and with Download options
  Given I am on the home page
  And I am an account admin
  Then I should see Resources
  When I follow Resources
  Then I should be on the resources page
  Then I should not see upload
  And I should see Download Link

Scenario: non logged in person cannot see Resources page tab
  Given I am on the home page
  And I am not logged in
  And I am a visitor
  Then I should not see Resources