class CreateEmailTrackerOpens < ActiveRecord::Migration[6.1]
  def change
    create_table :email_tracker_opens do |t|
      t.string :ip_address
      t.string :city
      t.string :state
      t.belongs_to :email_tracker_emails, foreign_key: true

      t.timestamps
    end
  end
end
