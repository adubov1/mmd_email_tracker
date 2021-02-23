module EmailTracker
  class Email < ApplicationRecord
    def tracking_link
      ActionController::Base.url_for controller: 'emails', action
  end
end
