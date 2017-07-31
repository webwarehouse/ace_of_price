require "uri"
require "net/http"

class AceOfPrice
  BASE_URL = 'http://localhost:3000/'
  SUBSCRIBE_PATH = 'api/subscriptions/'
  UNSUBSCRIBE_PATH = 'api/subscriptions/delete'

  def self.subscribe(key: nil, id: nil, url: nil)
    base_url = BASE_URL.concat(SUBSCRIBE_PATH)
    send_request(base_url, key: key, id: id, url: url) if key && url && id
  end

  def self.unsubscribe(key: nil, url: nil)
    base_url = BASE_URL.concat(UNSUBSCRIBE_PATH)
    send_request(base_url, key: key, url: url) if key && url
  end


private

  def send_request(base_url, key: nil, url: nil, id: nil)
    params = {
      'token'         => key,
      'external_id'   => id,
      'url'           => url
    }

    Net::HTTP.post_form(URI.parse(base_url), params)
  end
end
