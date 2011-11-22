module Marketplace
  require 'active_model'

  class GetReport < Report

    attr_accessor :action, :max_count, :report_id

    def initialize(options)
      options.each { |k,v| self.send("#{k}=", options[k]) }
    end

    def self.create(options)
      new(options).parameters
    end

    def action
      "GetReport"
    end
  end
end
