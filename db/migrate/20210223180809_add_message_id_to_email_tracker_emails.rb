class AddMessageIdToEmailTrackerEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :email_tracker_emails, :message_id, :string
  end
end
