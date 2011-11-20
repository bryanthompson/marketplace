module Marketplace
  require 'active_model'

  class RequestReport < Report
    include ActiveModel::Validations
    include RequestReportDateAttributes

    attr_accessor \
      :action,
      :report_type,
      :show_sales_channel,
      :version

    def initialize(options)
      options.each { |k,v| self.send("#{k}=", options[k]) }
    end

    def self.create(options)
      new(options).parameters
    end

    def action
      "RequestReport"
    end
  end
end
