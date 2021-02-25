module EmailTracker
  class Open < ApplicationRecord
    belongs_to :email
    after_create :geolocate

    def geolocate
      city, state = IpstackClient.city_and_state_from_ip(ip_address)
      update(city: city, state: state)
    end
  end
end
