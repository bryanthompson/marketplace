module Marketplace
  module Timestamp
    extend self

    require 'time'

    def utc
      Time.now.utc.iso8601
    end

    def to_params
      { "Timestamp" => utc }
    end
  end
end
