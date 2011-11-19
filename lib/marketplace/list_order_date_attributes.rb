module Marketplace
  module ListOrderDateAttributes
    require 'time'
    extend ActiveSupport::Concern

    DATE_ATTRIBUTES = [
      :created_after,
      :created_before,
      :last_updated_after,
      :last_updated_before
    ]

    included do
      attr_reader *DATE_ATTRIBUTES

      DATE_ATTRIBUTES.each do |attribute|
        define_method "#{attribute.to_s}=" do |value|
          if value.present?
            instance_variable_set(
              :"@#{attribute.to_s}",
              Time.parse(value).utc.iso8601
            )
          end
        end
      end
    end
  end
end

