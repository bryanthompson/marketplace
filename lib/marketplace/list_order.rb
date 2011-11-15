module Marketplace
  class ListOrder < Order
    include ActiveModel::Validations
    include Marketplace::Validators

    attr_accessor :created_after, :last_updated_after

    validates :created_after,
      presence: true,
      if: ->(order) { order.last_updated_after.blank? }

    validates :last_updated_after,
      presence: true,
      if: ->(order) { order.created_after.blank? }

    validates_with CreatedAfterValidator
    validates_with LastUpdatedAfterValidator

  end
end
