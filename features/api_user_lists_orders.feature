Feature: API user lists orders

  Scenario:
    Given the "US" endpoint
    And the "example_seller" seller
    And I send that endpoint a post to /orders with parameters:
      | created_after | 2011-11-01T04:00:00Z |
    Then I should get a 200 response
