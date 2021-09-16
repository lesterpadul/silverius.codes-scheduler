class CreateScheduledJobQueues < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_job_queues do |t|
      t.integer :status, :default => 0
      t.integer :schedule_type, :default => 0, :null => false
      t.integer :schedule_id, :default => 0, :null => false

      t.timestamps
    end
    add_index :scheduled_job_queues, :status
    add_index :scheduled_job_queues, :schedule_type
    add_index :scheduled_job_queues, :schedule_id
  end
end
