class AddIpAddressToEmailTrackerEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :email_tracker_emails, :origin_ip_address, :string
  end
end
