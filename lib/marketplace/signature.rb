module Marketplace
  require 'base64'
  require 'digest'

  class Signature
    attr_accessor :path, :query_string, :verb

    def initialize(path, query_string, verb="POST")
      self.path = path
      self.query_string = query_string
      self.verb = verb
    end

    def sign!
      sha.update(credentials.secret_key)
      encode
    end

    def encode
      Base64.encode64(sha.digest).gsub("\n", "")
    end

    def signature_string
      "#{verb}\n#{Marketplace::Endpoint.default}#{path}\n\n#{query_string}"
    end

    def sha
      Digest::HMAC.new(signature_string, Digest::SHA1)
    end

    def self.method
      "HmacSHA1"
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
      Marketplace::Credentials.instance
    end
  end
end
