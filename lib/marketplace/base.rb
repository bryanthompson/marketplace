module Marketplace
  class Base
    def self.attr_accessor(*vars)
      @attributes ||= []
      @attributes.concat(vars)
      super(*vars)
    end

    def self.attr_reader(*vars)
      @attributes ||= []
      @attributes.concat(vars)
      super(*vars)
    end

    def self.attributes
      @attributes
    end

    def attributes
      self.class.attributes
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
