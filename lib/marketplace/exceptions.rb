module Marketplace
  module Exceptions
    class QueryStringArgumentError < ArgumentError
      def message
        "There were no parameters from which to build a query string"
      end
    end
  end
end
