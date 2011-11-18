module Marketplace
  require 'base64'
  require 'digest'

  class Signature
    attr_accessor :path, :query_string, :seller, :verb

    def initialize(path, seller, query_string, verb="POST")
      self.path = path
      self.seller = seller
      self.query_string = query_string
      self.verb = verb
    end

    def sign!
      sha.base64digest
    end

    def signature_string
      "#{verb}\n#{Marketplace::Endpoint.default}\n#{path}\n#{query_string}"
    end

    def sha
      Digest::HMAC.new(credentials.secret_key, Digest::SHA256).tap do |hmac|
        hmac.update(signature_string)
      end
    end

    def self.method
      "HmacSHA256"
    end

    def self.version
      "2"
    end

    def self.to_params
      {
        "SignatureMethod" => method,
        "SignatureVersion" => version
      }
    end

    private
    def credentials
      Marketplace::Credentials.for(seller)
    end
  end
end
