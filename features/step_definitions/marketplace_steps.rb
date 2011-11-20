Given /^the "([^"]*)" endpoint$/ do |country|
  @endpoint = country
end

Given /^the "([^"]*)" seller$/ do |name|
  @seller = name
end

Given /^I send that endpoint a (get|post) to the ListOrders action with parameters:$/ do |method, table|
  @response = client.list_orders(table.rows_hash)
end

Given /^I send that endpoint a (get|post) to the RequestReport action with parameters:$/ do |method, table|
  @response = client.request_report(table.rows_hash)
end

Then /^I should get a (\d+) response$/ do |code|
  @response.code.should == code
end

def client
  Marketplace::Client.new(seller: @seller, endpoint: @endpoint)
end
