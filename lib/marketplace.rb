module Marketplace
  autoload :ActiveSupport, "active_support"
  autoload :Connection, "marketplace/connection"
  autoload :Exceptions, "marketplace/exceptions"
  autoload :QueryString, "marketplace/query_string"
  autoload :Resource, "marketplace/resource"

  extend self

  def get(params)
    Resource.build(params)
  end
end
