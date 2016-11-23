Feature: Core Members admin control
  As an admin of Da-tong
  So that I can decide which users are and are not core members
  I should be able to access a page that allows me to edit who the core members are

Scenario: Visiting the Core Members edit page without admin permissions
  Given I am not an admin
  And I am on the Edit Core Members page
  Then the page should not have a input#is_core_member element
  And I should not see Users

Scenario: Visiting the Core Members edit page with admin permissions
  Given I am an admin
  And I am on the Edit Core Members page
  Then the page should have a input#is_core_member element
  And I should see Users

Scenario: Adding a Core Member
  Given I am an admin
  And I am on the Edit Core Members page
  And the "Core Member" checkbox should not be checked
  And I check "is_core_member"
  And I press "Save"
  Then I should see Success
  And the "Core Member" checkbox should be checked

Scenario: Removing a Core Member
  Given I am an admin
  And I am on the Edit Core Members page
  And the "Core Member" checkbox should be checked
  And I uncheck "is_core_member"
  And I press "Save"
  Then I should see Success
  And the "Core Member" checkbox should be checked

Scenario: Cancelling addition of Core Member
  Given I am an admin
  And I am on the Edit Core Members page
  And the "Core Member" checkbox should not be checked
  And I check "is_core_member"
  And I press "Cancel"
  Then I should not see Success
  And the "Core Member" checkbox should not be checked

Scenario: Cancelling removal of Core Member
  Given I am an admin
  And I am on the Edit Core Members page
  And the "Core Member" checkbox should be checked
  And I uncheck "is_core_member"
  And I press "Cancel"
  Then I should not see Success
  And the "Core Member" checkbox should be checked