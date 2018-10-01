Feature: Waiting for Elements

  I want to be able to explicitly wait for an element
  In order to interact with the element once it is ready

  @migrated
  Scenario: Wait for Element - Positive
    When I navigate to the home page
    And I wait for the element that takes a while to appear
    Then the slow element appears
    And I am not made to wait for the full default duration

  @migrated
  Scenario: Wait for Element - Exceptions - Negative
    When I navigate to the home page
    Then an exception is raised when I wait for an element that won't appear

  @migrated
  Scenario: Wait for No Element - Positive
    When I navigate to the home page
    And I wait for the element that takes a while to disappear
    Then the removing element disappears
    And I am not made to wait for the full default duration

  @migrated
  Scenario: Wait for No Element - Exceptions - Negative
    When I navigate to the home page
    Then an exception is raised when I wait for an element that won't vanish

  Scenario: Wait for Visibility of element - Default Timeout
    When I navigate to the home page
    And I wait until a particular element is visible
    Then the previously invisible element is visible
    And I am not made to wait for the full default duration

  Scenario: Wait for Visibility of element - Overridden Timeout
    When I navigate to the home page
    And I wait for a specific amount of time until an element is visible
    Then the previously invisible element is visible
    And I am not made to wait for the full overridden duration

  Scenario: Wait for Visibility of element - Negative Test
    When I navigate to the home page
    Then I get a timeout error when I wait for an element that never appears

  Scenario: Wait for Invisibility of element - Default Timeout
    When I navigate to the home page
    And I wait for an element to become invisible
    Then the previously visible element is invisible

  Scenario: Wait for Invisibility of element - Overridden Timeout
    When I navigate to the home page
    And I wait a specific amount of time for a particular element to vanish
    Then the previously visible element is invisible

  Scenario: Wait for Invisibility of element - Negative Test
    When I navigate to the home page
    Then I get a timeout error when I wait for an element that never vanishes

  Scenario: Wait for Invisibility of element - Non-Existent Element
    When I navigate to the home page
    Then I am not made to wait to check a nonexistent element for invisibility

  Scenario: Wait for Invisibility of element - Non-Existent Section
    When I navigate to the home page
    And I remove the parent section of the element
    Then an error is thrown when waiting for an element in a vanishing section

  Scenario: Wait time can be overridden at run-time in a block
    When I navigate to the home page
    Then I can override the wait time using a Capybara.using_wait_time block