Feature: API user lists orders

  Scenario:
    Given the "US" endpoint
    And the "example_seller" seller
    And I send that endpoint a post to /orders with parameters:
      | created_after | 01/01/2011 00:00:00 |
    Then I should get a 200 response
