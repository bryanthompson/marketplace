Feature: API user requests merchant listings data lite report

  Scenario:
    Given the "US" endpoint
    And the "example_seller" seller
    And I send that endpoint a post to the RequestReport action with parameters:
      | report_type        | _GET_MERCHANT_LISTINGS_DATA_LITE_ |
      | start_date         | 2011-01-01 00:00:00               |
      | end_date           | 2011-12-31 00:00:00               |
      | show_sales_channel | true                              |
    Then I should get a 200 response
