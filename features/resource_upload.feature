Feature: When I visit the resources page as a core member, I would like to update resources
  As a user with proper permissions
  Whenever I visit the resources page
  I should be able to upload resources
  As a user without proper permissions
  I should not be able to upload resources

  Scenario: uploading resource as core member correctly
    Given I am on the resources page
    And I have core access
    Then I should see the add button #"Then I should see the /(.*)/ button |button|"
    When I follow add
    And I fill in title with Resource1
    And I fill in description with Fun test resource.
    And I upload the testfile
    When I press submit
    Then I should see Resource1
    
  Scenario: editing resource as core member correctly
    Given I am on the resources page
    And I have core access
    Then I should see the edit button 
    When I follow edit
    And I fill in title with Resource2
    And I fill in description with Fun test rename.
    And I upload the testfile
    When I press submit
    And I should see Resource2
    
  Scenario: deleting resource as core member correctly
    Given I am on the resources page
    And I have core access
    Then I should see the delete button 
    When I press delete
    And I should not see TestResourceName
    
  Scenario: uploading resource as core member incorrectly without title
    Given I am on the resources page
    And I have core access
    When I follow add
    And I fill in description with Fun test resource.
    And I upload the testfile
    When I press submit
    Then I should see Cannot upload resource without title
  
  Scenario: downloading resource as logged in member
    Given I am on the resources page
    And I have member access
    Then I should not see the add button
    And I should not see the edit button
    And I should see the download button
    
  Scenario: not seeing resource in navbar as visitor
    Given I am on the home page
    And I am not logged in
    Then I should not see Resources
  