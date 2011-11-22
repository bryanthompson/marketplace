module Marketplace
  autoload :ActiveModel, "active_model"
  autoload :ActiveSupport, "active_support"
  autoload :Agent, "marketplace/agent"
  autoload :Base, "marketplace/base"
  autoload :Client, "marketplace/client"
  autoload :Crack, "crack/xml"
  autoload :Credentials, "marketplace/credentials"
  autoload :Endpoint, "marketplace/endpoint"
  autoload :Exceptions, "marketplace/exceptions"
  autoload :GetReport, "marketplace/get_report"
  autoload :GetReportList, "marketplace/get_report_list"
  autoload :GetReportListDateAttributes, "marketplace/get_report_list_date_attributes"
  autoload :ListOrder, "marketplace/list_order"
  autoload :ListOrderDateAttributes, "marketplace/list_order_date_attributes"
  autoload :Order, "marketplace/order"
  autoload :OrderValidators, "marketplace/order_validators"
  autoload :QueryString, "marketplace/query_string"
  autoload :Report, "marketplace/report"
  autoload :Request, "marketplace/request"
  autoload :RequestReport, "marketplace/request_report"
  autoload :RequestReportDateAttributes, "marketplace/request_report_date_attributes"
  autoload :Response, "marketplace/response"
  autoload :Resource, "marketplace/resource"
  autoload :Signature, "marketplace/signature"
  autoload :Timestamp, "marketplace/timestamp"

  extend self

  def request(method, parameters={})
    if resource = Resource.build(parameters)
      Agent.send(method, resource.uri, resource.parameters)
    end
  end
end
