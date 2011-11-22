module Marketplace
  require 'active_model'

  class GetReportList < Report
    include ActiveModel::Validations
    include GetReportListDateAttributes

    attr_accessor \
      :action,
      :acknowledged,
      :max_count,
      :report_request_id_list,
      :report_type_list

    def initialize(options)
      options.each { |k,v| self.send("#{k}=", options[k]) }
    end

    def self.create(options)
      new(options).parameters
    end

    def action
      "GetReportList"
    end
  end
end
