Feature: Technician
  As an technician
  In order to perform activities
  I want to be able to view different pages

  Background:
      Given the website is set up
      And I am logged in as the technician

  Scenario: View all pens information
    Given I am on the pens page
    Then I should not see "Create"
    And I should see "Pen"
    And I should see "Total"
    And I should see "Pull"
    And I should see "Dead"
    And I should see "Feed"
    And I should see "Water"
    And I should see "Mud"
    And I should see "Maintenance"
    And I should see "Last Updated"
    And I should see "Modify"

  Scenario: View a pen's detail information
    Given I am on the pens page
    When I follow "Detail"
    Then I should be on the details page for pen "1"
    And I should see "Activities of Pen #1"
    And I should not see "Edit"
    And I should not see "Delete"
    When I visit "/pens/1/edit"
    Then I should see "Only admin users can perform that action"

  Scenario: View activities
    Given I am on the activities page
    Then I should see "All Activities"
    And I should see "Check-in Activity"
    And I should see "Pens"
    And I should see "User"
    And I should see "Pull"
    And I should see "Dead"
    And I should see "Feed"
    And I should see "Water"
    And I should see "Mud"
    And I should see "Maintenance"
    And I should see "Check-in"
    And I should see "Check-out"
    And I should see "Riding Time(mins)"

  Scenario: Check-in
    Given I am on the activities page
    And I should see "Check-in"
    When I follow "Check-in"
    And I should see "Check-in"
    And I select "1" from "Pen#"
    When I fill in "Pull(s)#" with "5"
    And I fill in "Dead(s)#" with "1"
    When I press "Check-out"
    Then I should see "activity was successfully created"

  Scenario: View all users
    Given I am on the users page
    Then I should see "All Users"
    And I should not see "Add user"
    And I should see "Administrator"
    And I should see "Test User"
    And I should see "Animal Technician"
    And I should see "Yard Technician"
    And I should see "Medical Technician"

  Scenario: Edit a other user's detail information
    Given I am on the users page
    When I follow "Courtney Daigle"
    Then I should be on the details page for user "2"
    And I should see "Courtney Daigle's Profile"
    And I should not see "Edit profile"
    When I visit "/users/2/edit"
    Then I should see "You can only edit your own account"

Scenario: Edit a other user's detail information
    Given I am on the users page
    When I follow "Test User"
    Then I should be on the details page for user "1"
    And I should see "Test User's Profile"
    And I should see "Edit profile"
    When I follow "Edit profile"
    Then I should be on the edit page for user "1"
    And I should see "Edit user profile"
    When I fill in "Last name" with "User Test"
    And I press "Update"
    And I should see "Test User Test"

  Scenario: View and resolve maintenance requests
      Given I am on the maintenances page
      When I press "Resolved"
      And I should see "No maintenance request"

  Scenario: View and resolve medical requests
      Given I am on the medical_calls page
      When I press "Resolved"
      And I should see "No medical request"

  Scenario: View and resolve mud requests
      Given I am on the mud_calls page
      When I press "Resolved"
      And I should see "No mud handling request"
