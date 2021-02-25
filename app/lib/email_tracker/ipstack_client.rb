require 'net/http'

module EmailTracker
    class IpstackClient
        BASE_URI = URI.parse("http://api.ipstack.com")
        begin
            @key = EmailTracker::Engine.config.ipstack_api_key
        rescue NoMethodError => e
            Logger.info('Not geolocating because IPStack API key missing')
        end

        def self.city_and_state_from_ip(ip_address)
            return [ nil, nil ] unless @key

            path = '/' + ip_address + "?access_key=#{@key}"
            req = Net::HTTP.get(BASE_URI.host, path)

            geolocation = JSON.parse req
            [ geolocation['city'], geolocation['state'] ]
        end
    end
end