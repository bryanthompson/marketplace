module Marketplace
  module ListOrderDateAttributes
    extend ActiveSupport::Concern

    DATE_ATTRIBUTES = [
      :created_after,
      :created_before,
      :last_updated_after,
      :last_updated_before
    ]

    included do
      DATE_ATTRIBUTES.each do |attribute|
        define_method "#{attribute}=" do |value|
          if value.present?
            instance_variable_set("@#{attribute}", value.utc.iso8601)
          end
        end
      end
    end
  end
end

