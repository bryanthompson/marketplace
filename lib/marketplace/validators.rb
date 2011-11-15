module Marketplace
  module Validators
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

  end
end
