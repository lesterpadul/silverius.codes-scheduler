# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_16_104438) do

  create_table "scheduled_emails", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "subject"
    t.string "content_text"
    t.string "content_html"
    t.integer "repeating_event", default: 0
    t.date "scheduled_date"
    t.time "scheduled_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repeating_event"], name: "index_scheduled_emails_on_repeating_event"
    t.index ["status"], name: "index_scheduled_emails_on_status"
  end

  create_table "scheduled_job_queues", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "status", default: 0
    t.integer "schedule_type", default: 0, null: false
    t.integer "schedule_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_scheduled_job_queues_on_schedule_id"
    t.index ["schedule_type"], name: "index_scheduled_job_queues_on_schedule_type"
    t.index ["status"], name: "index_scheduled_job_queues_on_status"
  end

  create_table "scheduled_tweets", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "content"
    t.integer "repeating_event", default: 0
    t.date "scheduled_date"
    t.time "scheduled_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repeating_event"], name: "index_scheduled_tweets_on_repeating_event"
    t.index ["status"], name: "index_scheduled_tweets_on_status"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "github_token"
    t.string "github_secret"
    t.string "twitter_token"
    t.string "twitter_secret"
    t.string "name"
    t.string "image_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
