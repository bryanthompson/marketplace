module Marketplace
  require 'yaml'

  class Credentials
    attr_accessor :merchant, :marketplace, :aws_access_key_id, :secret_key

    def initialize(options)
      self.merchant          = options["merchant"]
      self.marketplace       = options["marketplace"]
      self.aws_access_key_id = options["aws_access_key_id"]
      self.secret_key        = options["secret_key"]
    end

    def self.for(name)
      new(read_from_file[name])
    end

    def self.read_from_file
      YAML.load_file(File.join(root_directory, 'config', 'credentials.yml'))
    end

    def self.current_directory
      File.dirname(__FILE__)
    end

    def self.root_directory
      current_directory + "/../.."
    end

    def to_params
      {
        "SellerId" => merchant,
        "MarketplaceId.Id.1" => marketplace
      }
    end
  end
end
