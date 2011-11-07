Feature: API user lists orders

  Scenario:
    Given the "US" endpoint
    And I send that endpoint a post to /orders with parameters:
      | marketplace id | ATVPDKIKX0DER |
      | action         | ListOrders    |
      | created after  | 2011-01-01    |
    Then I should get a 200 response
