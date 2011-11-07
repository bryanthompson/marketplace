module Marketplace
  require 'base64'
  require 'digest'

  class Signature
    attr_accessor :secret_key

    def initialize(secret_key)
      self.secret_key = secret_key
    end

    def digest
      Digest::HMAC.new(secret_key, Digest::SHA1).digest
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

    def to_params
      {
        signature: encode!,
        signature_method: method,
        signature_version: version
      }
    end
  end
end
