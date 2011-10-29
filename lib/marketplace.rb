module Marketplace
  autoload :ActiveSupport, "active_support"
  autoload :Agent, "marketplace/agent"
  autoload :Connection, "marketplace/connection"
  autoload :Exceptions, "marketplace/exceptions"
  autoload :QueryString, "marketplace/query_string"
  autoload :Resource, "marketplace/resource"

  extend self

  def get(params)
    uri = Resource.build(params)
    Agent.get(uri)
  end
end
