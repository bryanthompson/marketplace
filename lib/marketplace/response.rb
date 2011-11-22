module Marketplace
  class Response

    def self.parse(document)
      Crack::XML.parse(document.body)
    end

  end
end
