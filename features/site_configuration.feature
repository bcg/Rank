Feature: Site Configuration

  Background:
    Given the site is configured
    
  @wip
  Scenario:
    Given a user with username "chris" and password "password"
    And I am logged in as "chris" with password "password"
    And I am on the site configuration page
    Then I should be on the site configuration page
    And I should see "foo"