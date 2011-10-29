module Marketplace
  class Connection
    attr_accessor :merchant, :markeplace, :aws_access_key_id, :secret_key

    def initialize(options)
      self.merchant          = options[:merchant]
      self.marketplace       = options[:marketplace]
      self.aws_access_key_id = options[:aws_access_key_id]
      self.secret_key        = options[:secret_key]
    end

    def self.connect(options)
      new(options)
    end
  end
end
