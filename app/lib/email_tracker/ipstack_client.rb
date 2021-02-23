module EmailTracker
    class IPStackClient
        include HTTParty
        base_uri 'api.ipstack.com'
        @options = { query: { access_key: Figaro.env.ipstack_api_key } }

        def self.city_and_state_from_ip(ip_address)
            geolocation = JSON.parse new.class.get("/#{ip_address}", @options).body
            [ geolocation['city'], geolocation['state'] ]
        end
    end
end