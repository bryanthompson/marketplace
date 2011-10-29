module Marketplace
  autoload :ActiveSupport, "active_support"
  autoload :Agent, "marketplace/agent"
  autoload :Connection, "marketplace/connection"
  autoload :Exceptions, "marketplace/exceptions"
  autoload :QueryString, "marketplace/query_string"
  autoload :Resource, "marketplace/resource"

  extend self

  def call(method, params={})
    if url = Resource.build(params.delete(:url))
      Agent.send(method, url, params)
    end
  end
end
