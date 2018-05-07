Feature: Log in as differnt users
    As a visitor
    In order to perform operations on the website
    I want to be able to view the home page and login using different users

    Background:
        Given the website is set up
        When I am on home page

    Scenario: View the home page
        And I should see "Daigle System"
        And I should see "Login"
    Scenario: View the about page
        When I follow "About"
        And I should see "The DAIGLE System"
        And I should see "Team Fantastic6 from Spring 2018 CSCE 606 Class"

    Scenario: Login as administrator
        Given I am on the login page
        Then I should see "Username"
        And I should see "Password"
        When I fill in "Username" with "admin"
        And I fill in "Password" with "password"
        When I press "Login"
        Then I should be on pens page
        And I should see "You have successfully logged in"

    Scenario: Login as technicians
        Given I am on the login page
        When I fill in "Username" with "test_user"
        And I fill in "Password" with "password"
        When I press "Login"
        Then I should be on activities page
        And I should see "You have successfully logged in"
        When I follow "Log out"
        Then I should see "You have logged out"
        When I am on the login page
        When I fill in "Username" with "test_user2"
        And I fill in "Password" with "password"
        When I press "Login"
        Then I should be on maintenances page
        And I should see "You have successfully logged in"
        When I follow "Log out"
        Then I should see "You have logged out"
        When I am on the login page
        When I fill in "Username" with "test_user3"
        And I fill in "Password" with "password"
        When I press "Login"
        Then I should be on medical page
        And I should see "You have successfully logged in"
        When I follow "Log out"
        Then I should see "You have logged out"

    Scenario: Login as wrong information
        Given I am on the login page
        When I fill in "Username" with "xxx"
        And I fill in "Password" with "xxx"
        When I press "Login"
        And I should see "There was something wrong with your login information"
        When I visit "/users"
        And I should see "Please login first to perform that action"
        When I visit "/pens"
        And I should see "Please login first to perform that action"
        When I visit "/activities"
        And I should see "Please login first to perform that action"
