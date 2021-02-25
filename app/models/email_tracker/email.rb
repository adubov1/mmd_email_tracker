module EmailTracker
  class Email < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_many :opens
    after_create :generate_tracking_blob

    def generate_tracking_blob
      return track_id if track_id

      track_id = Base64.encode64("#{from}_#{message_id}").strip
      if update(track_id: track_id)
          track_id
      else
          raise StandardError
      end
    end
  end
end
