# coding: utf-8
module HttpRequestAction
  def self.get_request(url)
    uri = URI.parse(url)
    return Net::HTTP.get(uri)
  end
end
