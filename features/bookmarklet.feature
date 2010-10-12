Feature: Bookmarklet

  Background:
    Given the site is configured

  Scenario: Flag from bookmarklet post
    Given a user with username "chris" and password "password"
    And I have not used the bookmarklet yet
    And I am logged in as "chris" with password "password"
    And I am on the dashboard
    Then I should see element ".auto-tools"
    When I post something with the bookmarklet
    And I am on the dashboard
    Then I should not see element ".auto-tools"
    
  # Scenario: Hide message
  #   Given a user with username "chris" and password "password"
  #   And I have not used the bookmarklet yet
  #   And I am logged in as "chris" with password "password"
  #   And I am on the dashboard
  #   Then I should see element ".auto-tools"
  #   When I follow "Click here"
  #   And I am on the dashboard
  #   Then I should not see element ".auto-tools"