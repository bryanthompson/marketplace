module Marketplace
  require 'cgi'
  require 'active_support/core_ext'

  class QueryString
    attr_writer :parts
    attr_accessor :path

    def initialize(parts, path)
      raise Marketplace::Exceptions::QueryStringArgumentError unless parts
      self.parts = parts
      self.path = path
    end

    def to_canonical
      CGI.escape(parameters)
    end

    def parts=(parts)
      @parts ||= parts
        .merge(timestamp.to_params)
        .merge(credentials.to_params)
        .merge(Marketplace::Signature.to_params)
        .merge(AWSAccessKeyId: credentials.aws_access_key_id)
    end

    def parts
      Hash[@parts.map { |k,v| [camelize(k),v] }.sort]
    end

    def parameters
      "?" + parts.to_query
    end

    def to_hash
      parts.merge("Signature" => signature.sign!)
    end

    private
    def camelize(name)
      name.to_s.camelize.gsub(" ", "")
    end

    def credentials
      Marketplace::Credentials.instance
    end

    def timestamp
      Marketplace::Timestamp
    end

    def signature
      Signature.new(path, to_canonical)
    end
  end
end
