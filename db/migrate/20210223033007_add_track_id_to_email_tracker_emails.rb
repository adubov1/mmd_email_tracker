class AddTrackIdToEmailTrackerEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :email_tracker_emails, :track_id, :string
  end
end
