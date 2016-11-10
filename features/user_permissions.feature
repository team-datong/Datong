Feature: User Permissions 
  As a user of da-tong
  so that I can traverse the website with appropriate permissions
  I should be able to view or edit pages depending on those permissions

Scenario: Visiting the Datong website not logged in
  Given I am a Visitor
  And I am on the home page
  Then I should not see Resources in the navbar
  When I am on the Resources page
  Then I should see You do not have permission to access this page. 
  And I should not see resource.pdf

Scenario: Visiting the Datong website as a logged in user
  Given I am a Berkeley Student or a non-Berkeley student user
  And I am on the Resources page
  Then I should see resource.pdf

Scenario: Core Members have permission to add/edit resources
  Given I am a Core Member
  And I am on the Resources page
  Then I should see the Add Resource button
  And I should see the Edit button next to each resource

Scenario: Non-core members should not have permission to add/edit resources
  Given I am not a Core Member
  And I am on the Resources page
  Then I should not see the Add Resource button
  And I should not see the Edit button next to each resource

Scenario: Events Manager has permission to add events
  Given I am a Events Manager
  And I am on the Upcoming Events page
  Then I should see the Add Event button

Scenario: Nobody but the Events Manager should be able to add events
  Given I am not a Events Manager
  And I am on the Upcoming Events page
  Then I should not see the Add Event button

Scenario: Accounts Manager has permission to change other's accounts permissions
  Given I am a Accounts Manager
  And I am on the home page
  Then I should see Manage Accounts in the navbar 
  And I should see a list of accounts
  
Scenario: Nobody but the Accounts Manager should be able to see a list of users
  Given I am not a Accounts Manager
  And I am on the home page
  Then I should not see Manage Accounts in the navbar
  And when I on the Manage Accounts page
  Then I should see You do not have permission to access this page.

Scenario: non-Berkeley student users are not any other level of user
  Given I am a non-Berkeley student user
  Then I should not be a Berkeley student
  And I should not be a Core Member
  And I should not be Events Manager
  And I should not be Accounts Manager

Scenario: Berkeley student users are not any other level of user
  Given I am a Berkeley student
  Then I should not be a Core Member
  And I should not be Events Manager
  And I should not be Accounts Manager

Scenario: Core members are Berkeley students and Core members, but not any higher level
  Given I am a Core Memeber
  Then I should be a Berkeley student
  And I should not be Events Manager
  And I should not be Accounts Manager

Scenario: The Events Manager is a Berkeley Student, Core member, but not the Accounts Manager
  Given I am a Events Manager
  Then I should be a Berkeley student
  And I should be a Core Member
  And I should not be Accounts Manager

Scenario: The Accounts Manager is a Berkeley Student, Core member, but not the Events Manager
  Given I am a Accounts Manager
  Then I should be a Berkeley stduent
  And I should be a Core Member
  And I should not be Events Manager
