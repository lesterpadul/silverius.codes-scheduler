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

ActiveRecord::Schema.define(version: 2021_09_23_105910) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "message_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "receiver_id"
    t.string "message_code"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "last_chat_id"
    t.index ["message_code"], name: "index_message_groups_on_message_code"
    t.index ["receiver_id"], name: "index_message_groups_on_receiver_id"
    t.index ["status"], name: "index_message_groups_on_status"
    t.index ["user_id"], name: "index_message_groups_on_user_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.string "message_code"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_code"], name: "index_messages_on_message_code"
    t.index ["status"], name: "index_messages_on_status"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "photo_galleries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "user_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status"], name: "index_photo_galleries_on_status"
    t.index ["user_id"], name: "index_photo_galleries_on_user_id"
  end

  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "user_id"
    t.integer "photo_gallery_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_gallery_id"], name: "index_photos_on_photo_gallery_id"
    t.index ["status"], name: "index_photos_on_status"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "scheduled_emails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "subject"
    t.string "content_text"
    t.string "content_html"
    t.integer "repeating_event", default: 0
    t.date "scheduled_date"
    t.time "scheduled_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "target_emails", default: "", null: false
    t.index ["repeating_event"], name: "index_scheduled_emails_on_repeating_event"
    t.index ["status"], name: "index_scheduled_emails_on_status"
    t.index ["user_id"], name: "index_scheduled_emails_on_user_id"
  end

  create_table "scheduled_job_queues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "status", default: 0
    t.integer "schedule_type", default: 0, null: false
    t.integer "schedule_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_scheduled_job_queues_on_schedule_id"
    t.index ["schedule_type"], name: "index_scheduled_job_queues_on_schedule_type"
    t.index ["status"], name: "index_scheduled_job_queues_on_status"
  end

  create_table "scheduled_tweets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "content"
    t.integer "repeating_event", default: 0
    t.date "scheduled_date"
    t.time "scheduled_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tweet_id"
    t.integer "user_id"
    t.index ["repeating_event"], name: "index_scheduled_tweets_on_repeating_event"
    t.index ["status"], name: "index_scheduled_tweets_on_status"
    t.index ["user_id"], name: "index_scheduled_tweets_on_user_id"
  end

  create_table "user_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.string "twitter_user_name"
    t.string "about_me"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
