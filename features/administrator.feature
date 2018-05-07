Feature: Administrator
  As an administrator
  In order to perform managing oprations
  I want to be able to view different pages

  Background:
      Given the website is set up
      And I am logged in as the adminitrator

  Scenario: View all pens information
    Given I am on the pens page
    Then I should see "Create"
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
    When I follow "Pen"
    Then I should see "1"

  Scenario: View a pen's detail information
    Given I am on the pens page
    When I follow "Detail"
    Then I should be on the details page for pen "1"
    And I should see "Activities of Pen #1"
    And I should see "Edit"
    And I should see "Delete"

  Scenario: Edit a pen's detail information
    Given I am on the details page for pen "1"
    When I follow "Edit"
    Then I should be on the edit page for pen "1"
    And I should see "Edit existing pen"
    When I fill in "Total#" with "95"
    And I press "Update Pen"
    Then I should be on the details page for pen "1"
    And I should see "95"

  Scenario: Create a pen
    Given I am on the pens page
    When I follow "Create"
    And I should see "Create an pen"
    When I fill in "Pen#" with "2"
    When I fill in "Total#" with "95"
    And I press "Create Pen"
    Then I should see "Pen was successfully created"
    And I should see "2"

  Scenario: Delete a pen
    Given I am on the details page for pen "1"
    When I follow "Delete"
    And I should see "Pen was successfully deleted"

  Scenario: View activities
    Given I am on the activities page
    Then I should see "All Activities"
    And I should not see "Check-in Activity"
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
    When I visit "/activities/new"
    Then I should see "Only animal technician can perform that action"

  Scenario: View reports
    Given I am on the reports page
    Then I should see "Monthly Reports"
    And I should see "Date"
    And I should see "Pen"
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

  Scenario: View all users
    Given I am on the users page
    Then I should see "All Users"
    And I should see "Administrator"
    And I should see "Test User"
    And I should see "Animal Technician"
    And I should see "Yard Technician"
    And I should see "Medical Technician"

  Scenario: Add a users
    Given I am on the users page
    When I follow "Add"
    And I should see "Add user"
    When I fill in "Username" with "testtest"
    And I fill in "Password" with "password"
    And I fill in "First name" with "Test"
    And I fill in "Last name" with "Test"
    And I check "Animal Technician?"
    And I check "Yard Technician?"
    And I check "Medical Technician?"
    And I fill in "Email" with "testaddress@test.com"
    And I fill in "Phone" with "0000000000"
    And I fill in "Address" with "test address"
    When I press "Confirm"
    Then I should see "Welcome to the Diagle System"
    And I should see "Test Test"

  Scenario: Edit a user's detail information
    Given I am on the users page
    When I follow "Test User"
    Then I should be on the details page for user "1"
    And I should see "Test User's Profile"
    When I follow "Edit profile"
    Then I should be on the edit page for user "1"
    And I should see "Edit user profile"
    When I fill in "Last name" with "User Test"
    And I press "Update"
    And I should see "Test User Test"

  Scenario: Delete a user
    Given I am on the users page
    When I follow "Test User"
    Then I should be on the details page for user "1"
    And I should see "Test User's Profile"
    When I follow "Delete this user"
    And I should see "User and all activities created by user have been deleted"
