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

Given /^I send that endpoint a post to the GetReportList action$/ do
  @response = client.get_report_list
end

Given /^I send that endpoint a (get|post) to the GetReport action with parameters:$/ do |method, table|
  id = @client.response["GetReportListResponse"]["GetReportListResult"]["ReportInfo"].first["ReportId"]
  @response = client.get_report(table.rows_hash.merge(report_id: id))
end

Given /^I get the first report from that list$/ do
  id = @client.response["GetReportListResponse"]["GetReportListResult"]["ReportInfo"].first["ReportId"]
  @response = client.get_report(report_id: id)
end

Given /^I send that endpoint a post to the SubmitFeed action with parameters:$/ do |table|
  body = table.rows_hash.delete("body")
  @response = client.submit_feed(body, table.rows_hash)
end

Then /^I should get a (\d+) response$/ do |code|
  @response.code.should == code
end

def client
  @client ||= Marketplace::Client.new(seller: @seller, endpoint: @endpoint)
end
