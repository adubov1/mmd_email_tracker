class CreateEmailTrackerEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :email_tracker_emails do |t|
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
