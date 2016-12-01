Feature: When I visit a static page, its content should match its counterpart on datong.berkeley.edu
  As a visitor
  Whenever I visit a static page
  I should be able to see the same as I did in datong.berkeley.edu

  Scenario: visiting the about us page
    Given I am on the about us page
    Then I should see the nav bar
    And I should see About Us
    And I should see 关于大同
    And I should see 大同学社是伯克利第一个以中国和东亚为研究方向的本科学生组织，为所有对社会科学感兴趣的同学提供一片自由探讨的净土。上承《礼记》“天下大同”的理想憧憬，大同学社旨在伯克利开放多元的环境中寻求社会科学学术研究之大同，给予社会学科应有的重视。

  Scenario: visiting the home page
    Given I am on the home page
    Then I should see the nav bar
    And I should see Hosted by OCF
    And I should see Sponsor
    And I should see Passion
    And I should see 积极的学术热情，无私的学术精神
    And I should see Integrity
    And I should see 优良的学术品质，独立的学术能力
    And I should see Open-mindness
    And I should see 持重的学术态度，包容的学术胸怀
    And I should not see Core Members

  Scenario: visiting the people page
    Given I am on the people page
    Then I should see the nav bar
    And I should see Core Members

  Scenario: visiting the events page
    Given I am on the home page
    When I follow Events
    Then I should see Upcoming Events
  
  Scenario: visiting the resources page
    Given I am on the home page
    And I am logged in
    When I follow Resources
    Then I should see Upload Resource

  Scenario: visiting the contact us page
    Given I am on the contact us page
    Then I should see Contact Us
    And I should see Facebook
    And I should see WeChat Official Account
