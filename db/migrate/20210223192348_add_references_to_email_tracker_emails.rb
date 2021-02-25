class AddReferencesToEmailTrackerEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :email_tracker_opens, :email_id, :integer
    add_index :email_tracker_opens, [:email_id], name: 'index_email_tracker_email_id'
  end
end
