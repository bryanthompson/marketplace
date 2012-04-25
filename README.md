Marketplace
===========

Marketplace is an [Amazon MWS](http://developer.amazonservices.com) API wrapper for ruby.

This gem was originally developed for a client but the project was abandoned and I didn't get paid in full. At this time it supports a specific set of features. In reality it does a lot more because there is a fair amount of work that has to be done to interact initially with Amazon's API. For example support for the Feeds API is nearly complete as a side effect of getting merchant product listings. It is rough around the edges and could use some input from the community. If you'd like to help out please get in touch with me or clone it and go to town.

Usage
-----

To begin you need a credentials yaml file which at this time is assumed to be in config/credentials.yml in the root of the marketplace directory. It must be in this format:

```ruby
example_seller:
    merchant: XXXXXXXXXXXXXX
    marketplace: XXXXXXXXXXXXX
    aws_access_key_id: XXXXXXXXXXXXXXXXXXXX
    secret_key: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

Instantiate a new client instance:

`client = Marketplace::Client.new(seller: "example_seller", endpoint: "US")`

Supported Features
------------------

1. Supports all marketplaces (us, ca, uk, jp, de, & fr endpoints)

2. Product pricing updates - Price and Quantity Only Loader flat file:  (MWS Feeds Api Reference, Page 11):

    Posts a tab delimited file, containing for example "sku","price","quantity" columns

    ```ruby
    '_POST_FLAT_FILE_PRICEANDQUANTITYONLY_UPDATE_DATA_'

    client.submit_feed(
        feed_type: "_POST_FLAT_FILE_PRICEANDQUANTITYONLY_UPDATE_DATA_",
        body: "price,quantity\n10.00,1",
        purge_and_replace: false
    )
    ```

3. Returns Merchant product listings

    ```ruby
    'Merchant Listings Lite Report',  "_GET_MERCHANT_LISTINGS_DATA_LITE_"

    client.submit_feed(
        report_type: "_GET_MERCHANT_LISTINGS_DATA_LITE_",
        start_date: "2011-01-01 00:00:00",
        end_date: "2011-12-31 00:00:00,
        show_sales_channel: true
    )
    ```

4. Retrieval of merchant orders

    ```ruby
    client.list_orders(created_after: "2011-01-01 00:00:00")
    ```

5. Order shipping confirmation

    ```ruby
    client.list_orders(created_after: "2011-01-01 00:00:00")
    client.get_report_list
    id = client.response["GetReportListResponse"]["GetReportListResult"]["ReportInfo"].first["ReportId"]
    response = client.get_report(max_count: 1, report_id: id)
    ```

Getting Involved
----------------

- Clone
- Setup the credentials.yml file with your own marketplace credentials
- Run rake (tests should be green)

To do items:

- Cleanup the external api
- Fully wrap each api:
  - Feeds
  - Reports
  - Inbound Shipments
  - Inventory
  - Outbound Shipments
  - Orders
  - Products
  - Sellers
