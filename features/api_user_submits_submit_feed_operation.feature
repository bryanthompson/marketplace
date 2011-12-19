Feature: API user submits SubmitFeed operation

  Scenario:
    Given the "US" endpoint
    And the "example_seller" seller
    And I send that endpoint a post to the SubmitFeed action with parameters:
      | feed_type         | _POST_FLAT_FILE_FULFILLMENT_DATA_ |
      | body              | price,quantity                    |
      | purge_and_replace | false                             |
    Then I should get a 200 response
