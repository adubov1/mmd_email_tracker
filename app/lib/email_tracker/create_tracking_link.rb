module EmailTracker
    class CreateTrackingLink

        def call(email)
            track_id = SecureRandom.urlsafe_base64(25, false)
            if email.update(track_id: track_id)
                email.tracking_link
            else
                raise StandardError
            end
        end
    end
end