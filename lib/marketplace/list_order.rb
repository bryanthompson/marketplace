module Marketplace
  require 'active_model'
  require 'marketplace/order_validators'

  class ListOrder < Order
    include ActiveModel::Validations
    include Marketplace::OrderValidators
    include Marketplace::ListOrderDateAttributes

    attr_accessor \
      :order_status,
      :fullfillment_channel,
      :payment_method,
      :buyer_email,
      :seller_order_id,
      :max_results_per_page,
      :path,
      :action

    validates \
      :created_after,
      presence: true,
      if: ->(order) do
        order.last_updated_after.blank?
      end

    validates \
      :last_updated_after,
      presence: true,
      if: ->(order) do
        order.created_after.blank?
      end

    validates_with CreatedAfterValidator
    validates_with LastUpdatedAfterValidator

    def initialize(options)
      options.each { |k,v| self.send("#{k}=", options[k]) }
    end

    def self.create(options)
      new(options).parameters
    end

    def path
      "orders"
    end

    def action
      "ListOrders"
    end

    def parameters
      Hash[attributes.map do |attribute|
        if value = send(attribute)
          [attribute, value]
        end
      end]
    end
  end
end
