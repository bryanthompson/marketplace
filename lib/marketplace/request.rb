module Marketplace
  require 'tempfile'
  require 'net/http/post/multipart'

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
      Net::HTTP::Post::Multipart.new(uri.path, 
        file: UploadIO.new(file, "text/xml", "data.xml")).tap do |post|
          post.set_form_data(query_string.to_hash)
          post["Content-MD5"] = md5 if body
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
        file.each { |line| digest.update(line.chomp) }
      end.base64digest
    end
  end
end
