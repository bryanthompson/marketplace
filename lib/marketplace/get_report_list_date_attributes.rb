module Marketplace
  module GetReportListDateAttributes
    require 'date'

    extend ActiveSupport::Concern

    DATE_ATTRIBUTES = [
      :available_from_date,
      :available_to_date
    ]

    included do
      attr_reader *DATE_ATTRIBUTES

      DATE_ATTRIBUTES.each do |attribute|
        define_method "#{attribute.to_s}=" do |value|
          if value.present?
            instance_variable_set(
              :"@#{attribute.to_s}",
              DateTime.parse(value).iso8601
            )
          end
        end
      end
    end
  end
end

