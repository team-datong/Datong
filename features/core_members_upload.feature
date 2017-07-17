Feature: only allow core members to upload
  As a Datong officer, so that I can allow core members to upload files.
  I want core members to have an upload button that registered members do not have.

Scenario: core members can upload and download
  Given I am on the home page
  And I am a core member
  When I follow Resources
  Then I should be on the Resources page
  And I should see “Upload”
  And i should see “Download”

Scenario: non-core-members cannot upload but can download
  Given I am on the home page
  And I am a registered member
  And I should not see “Resources”


Scenario: core member can see and navigate to Resources page with Upload and Download options
  Given I am on the home page
  And I am a core member
  Then I should see Resources
  When I follow Resources
  Then I should be on the resources page
  Then I should see Upload
  And I should see Download

Scenario: event admin can see and navigate to Resources page without Upload and with Download options
  Given I am on the home page
  And I am an event admin
  Then I should see Resources
  When I follow Resources
  Then I should be on the resources page
  Then I should not see Upload
  And I should see Download

Scenario: account admin can see and navigate to Resources page without Upload and with Download options
  Given I am on the home page
  And I am an account admin
  Then I should see Resources
  When I follow Resources
  Then I should be on the resources page
  Then I should not see Upload
  And I should see Download

