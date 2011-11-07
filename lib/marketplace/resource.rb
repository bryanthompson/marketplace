module Marketplace
  require "active_support/core_ext"

  class Resource
    attr_writer :endpoint
    attr_reader :parameters, :path

    EXTRA_PARAMS = [:endpoint, :path]

    def initialize(parameters)
      self.endpoint   = parameters[:endpoint]
      self.path       = parameters[:path]
      self.parameters = parameters
    end

    def self.build(parameters)
      new(parameters)
    end

    def delimited?
      @endpoint.ends_with?(delimiter)
    end

    def delimiter
      "/"
    end

    def delimit!
      @endpoint + delimiter
    end

    def endpoint
      delimited? || delimit!
    end

    def parameters=(hsh)
      @parameters ||= hsh.delete_if do |k,v|
        EXTRA_PARAMS.include?(k.to_sym)
      end
    end

    def path=(value)
      @path ||= value.titleize if value.present?
    end

    def uri
      URI.parse(url)
    end

    def url
      [endpoint, path].compact.join
    end
  end
end
