require 'net/http'

module EmailTracker
    class IpstackClient
        BASE_URI = URI.parse("http://api.ipstack.com")
        ACCESS_KEY = Figaro.env.ipstack_api_key

        def self.city_and_state_from_ip(ip_address)
            path = '/' + ip_address + "?access_key=#{ACCESS_KEY}"
            req = Net::HTTP.get(BASE_URI.host, path)

            geolocation = JSON.parse req
            [ geolocation['city'], geolocation['state'] ]
        end
    end
end