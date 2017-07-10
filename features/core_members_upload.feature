Feature: only allow core members to upload
  As a Datong officer, so that I can allow core members to upload files.
  I want core members to have an upload button that registered members do not have.

Scenario: core members can upload and download
  Given I am on the Home page
  And I am a core member
  When I follow “Resources”
  Then I should be on the Resources page
  And I should see “Upload”
  And i should see “Download”

Scenario: non-core-members cannot upload but can download
  Given I am on the Home page
  And I am a registered member
  When I follow “Resources”
  Then I should be on the Resources page
  And I should not see “Upload”
  And i should see “Download”
