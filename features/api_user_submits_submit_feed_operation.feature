Feature: API user submits SubmitFeed operation

  Scenario:
    Given the "US" endpoint
    And the "example_seller" seller
    And I send that endpoint a post to the SubmitFeed action with parameters:
      | feed_type | _POST_FLAT_FILE_FULFILLMENT_DATA_ |
      | body      | price\tquantity\n5\t1             |
    Then I should get a 200 response
