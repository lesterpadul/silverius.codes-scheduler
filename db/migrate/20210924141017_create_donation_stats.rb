class CreateDonationStats < ActiveRecord::Migration[5.2]
  def change
    create_table :donation_stats do |t|
      t.integer :user_id
      t.integer :total_donations
      t.integer :total_donations_day
      t.integer :total_donations_week
      t.integer :total_donations_month

      t.timestamps
    end
    add_index :donation_stats, :user_id
  end
end
