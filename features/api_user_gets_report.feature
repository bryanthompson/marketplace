Feature: API user gets report

  Scenario:
    Given the "US" endpoint
    And the "example_seller" seller
    And I send that endpoint a post to the ListOrders action with parameters:
      | created_after | 2011-01-01 00:00:00 |
    And I send that endpoint a post to the GetReportList action
    And I send that endpoint a post to the GetReport action with parameters:
      | max_count | 1 |
    Then I should get a 200 response
