module Marketplace
  class ListOrder < Order
    class CreatedAfterValidator < ActiveModel::Validator
      def validate(obj)
        if obj.created_after.present? && obj.last_updated_after.present?
          obj.errors[:created_after] << "can't be used in conjunction with Last Updated After"
        end
      end
    end

    class LastUpdatedAfterValidator < ActiveModel::Validator
      def validate(obj)
        if obj.created_after.present? && obj.last_updated_after.present?
          obj.errors[:last_updated_after] << "can't be used in conjunction with Created After"
        end
      end
    end

    include ActiveModel::Validations

    attr_accessor :created_after, :last_updated_after

    validates :created_after,
      presence: true,
      if: ->(order) { order.last_updated_after.blank? }

    validates_with CreatedAfterValidator
    validates_with LastUpdatedAfterValidator

  end
end
