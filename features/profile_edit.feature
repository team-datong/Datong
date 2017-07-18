Feature: When I visit the people page, I should be able to update my profile and save changes.
  As a core user, so that I can customize my profile.
  I want to be able to edit my profile picture.
  
Scenario: core memers can update their profile picture
  Given I am on the people page
  And I am a core member
  #Change to whatever button name is
  When I press "Update"
  Then I should be on the update profile page
  When I attach the file "new_profile.jpg" to "profile_picture"
  And I press "Save"
  Then I should be on the people page
  #If we want to notify users that their save has succeeded
  And I should see Profile Saved
  And I should see the image "new_profile.jpg"