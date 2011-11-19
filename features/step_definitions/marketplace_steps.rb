Given /^the "([^"]*)" endpoint$/ do |country|
  @endpoint = country
end

Given /^the "([^"]*)" seller$/ do |name|
  @seller = name
end

Given /^I send that endpoint a (get|post) to \/(orders) with parameters:$/ do |method, path, table|
  client = Marketplace::Client.new(seller: @seller, endpoint: @endpoint)
  @response = client.list_orders(table.rows_hash)
end

Then /^I should get a (\d+) response$/ do |code|
  @response.code.should == code
end
