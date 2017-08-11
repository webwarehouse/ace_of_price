require "uri"
require "net/http"

class AceOfPrice
  BASE_URL = 'http://aceofprice.com'
  SUBSCRIBE_PATH = 'api/subscriptions/'
  UNSUBSCRIBE_PATH = 'api/subscriptions/delete'

  class << self

    def subscribe(key: nil, id: nil, url: nil)
      base_url = BASE_URL + SUBSCRIBE_PATH
      AceOfPrice.send_request(base_url, key, url, id) if key && url && id
    end

    def unsubscribe(key: nil, url: nil)
      base_url = BASE_URL + UNSUBSCRIBE_PATH
      AceOfPrice.send_request(base_url, key, url, nil) if key && url
    end

    def send_request(base_url, key, url, id)
      params = {
        'token'         => key,
        'external_id'   => id,
        'url'           => url
      }

      Net::HTTP.post_form(URI.parse(base_url), params)
    end

  end
end
