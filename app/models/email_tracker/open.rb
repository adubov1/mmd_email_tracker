require_dependency '../lib/ipstack_client'

module EmailTracker
  class Open < ApplicationRecord
    belongs_to :email
    after_create :geolocate

    def geolocate
      city, state = IPStackClient.city_and_state_from_ip(ip_address)
      update(city: city, state: state)
  end
end
