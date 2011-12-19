module Marketplace
  class Feed < Base
    attr_accessor :action, :feed_type, :purge_and_replace 

    def initialize(options)
      options.each { |k,v| self.send("#{k}=", options[k]) }
    end

    def self.submit(options)
      new(options).parameters
    end

    def action
      "SubmitFeed"
    end
  end
end
