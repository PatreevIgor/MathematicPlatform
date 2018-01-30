require 'uri'
require 'net/http'

class RequestSender
  def send_request(params)
    response_json = Net::HTTP.post_form(URI.parse(APP_CONFIG['host']), params).body

    JSON.parse(response_json)
  end
end
