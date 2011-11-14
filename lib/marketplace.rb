module Marketplace
  autoload :ActiveSupport, "active_support"
  autoload :ActiveModel, "active_model"
  autoload :Client, "marketplace/client"
  autoload :Base, "marketplace/base"
  autoload :Agent, "marketplace/agent"
  autoload :Request, "marketplace/request"
  autoload :Credentials, "marketplace/credentials"
  autoload :Endpoint, "marketplace/endpoint"
  autoload :Exceptions, "marketplace/exceptions"
  autoload :QueryString, "marketplace/query_string"
  autoload :Resource, "marketplace/resource"
  autoload :Signature, "marketplace/signature"
  autoload :Timestamp, "marketplace/timestamp"
  autoload :Order, "marketplace/order"
  autoload :ListOrder, "marketplace/list_order"
  autoload :OrderValidators, "marketplace/order_validators"
  autoload :ListOrderDateAttributes, "marketplace/list_order_date_attributes"

  extend self

  def request(method, parameters={})
    if resource = Resource.build(parameters)
      Agent.send(method, resource.uri, resource.parameters)
    end
  end
end
