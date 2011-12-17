module Marketplace
  require 'tempfile'

  class Request
    attr_accessor :body, :parameters, :uri

    def initialize(uri, parameters={}, body=nil)
      self.uri = uri
      self.parameters = parameters
      self.body = body
    end

    def file
      Tempfile.new("data").tap do |f|
        f.write(body)
      end
    end

    def data
      Net::HTTP::Post.new(uri.path).tap do |post|
        post.set_form_data(query_string.to_hash)
        if body
          post['Content-MD5'] = md5
          post.content_type = 'text/xml'
          post.content_length = file.size
          post.body_stream = file.tap(&:rewind)
        end
      end
    end

    def submit
      Net::HTTP.start(uri.host, 443, use_ssl: true) do |h|
        h.verify_mode = OpenSSL::SSL::VERIFY_NONE
        h.request(data)
      end
    end

    private
    def query_string
      Marketplace::QueryString.new(uri.path, parameters)
    end

    def md5
      Digest::MD5.new.tap do |digest|
        digest.update(file.tap(&:rewind).read)
      end.base64digest
    end
  end
end
