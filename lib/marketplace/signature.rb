module Marketplace
  class Signature
    require 'base64'
    require 'digest'

    attr_accessor :key

    def initialize(key)
      self.key = key
    end

    def digest
      Digest::HMAC.new(key, Digest::SHA1).digest
    end

    def encode!
      Base64.encode64(digest).gsub("\n", "")
    end

    def method
      "HmacSHA1"
    end

    def version
      "2"
    end
  end
end
