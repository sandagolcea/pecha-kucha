Feature: Start randomization
  As a surprising coach
  In order to make the Pecha Kucha more exciting
  I want to randomize the sequence of the users

  Scenario: Input names
    Given I am on the homepage
    When I fill in "mytext" with "Matteo, Sanda, Jin"
    And I press "Add"
    Then I should see "Matteo, Sanda, Jin"

  Scenario: Output random names
    Given I am on the homepage
    When I fill in "mytext" with "Matteo, Sanda, Jin"
    And I press "Add"
    And I press "Start Pecha Kucha"
    Then I should see "A big round of applause for.."
