Feature: When I visit the resources page as a core member, I would like to update resources
  As a user with proper permissions
  Whenever I visit the resources page
  I should be able to upload resources
  As a user without proper permissions
  I should not be able to upload resources

  Scenario: uploading resource as core member correctly
    Given I am logged in
    #And I have core access
    And I am on the resources page
    Then I should see Upload Resource
    When I follow upload
    And I fill in "resource_title" with "Resource1"
    And I upload the "testfile"
    When I press submit
    Then I should see Resource1
    
  # Scenario: deleting resource as core member correctly
  #   Given I am on the resources page
  #   #And I have core access
  #   And I am logged in
  #   Then I should see the delete button 
  #   When I press delete
  #   And I should not see TestResourceName
    
  # Scenario: uploading resource as core member incorrectly without title
  #   Given I am on the resources page
  #   #And I have core access
  #   And I am logged in
  #   When I follow upload
  #   And I upload the testfile
  #   When I press submit
  #   Then I should see Title can't be blank
    
  # Scenario: uploading resource as core member incorrectly without title
  #   Given I am on the resources page
  #   #And I have core access
  #   And I am logged in
  #   When I fill in title with Resource1
  #   And I upload the testfile
  #   When I press submit  
  #   Then I should see Attachment can't be blank
  
  # Scenario: downloading resource as logged in member
  #   Given I am on the resources page
  #   And I have member access
  #   And I should see the download button
    
  # Scenario: not seeing resource in navbar as visitor
  #   Given I am on the home page
  #   And I am not logged in
  #   Then I should not see Resources
  