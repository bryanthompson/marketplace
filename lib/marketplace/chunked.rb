module Marketplace
  class Chunked
    attr_accessor :size, :file
    def initialize(data, chunk_size)
      self.size = chunk_size
      self.file = data if data.respond_to? :read
    end
    
    def read(foo)
      file.read(size) if file
    end

    def eof!
      file.eof!
    end

    def eof?
      file.eof?
    end
  end
end
