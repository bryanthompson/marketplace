Given /^the "([^"]*)" endpoint$/ do |country|
  @endpoint = Marketplace::Endpoint[country]
end

Given /^I send that endpoint a (get|post) to \/(orders) with parameters:$/ do |method, path, table|
  parameters = table.rows_hash.merge(endpoint: @endpoint, path: path)
  @response ||= Marketplace.request(method, parameters)
end

Then /^I should get a (\d+) response$/ do |code|
  @response.code.should == code
end
