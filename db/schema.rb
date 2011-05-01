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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110430054416) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "meetup_id"
    t.integer  "group_id"
    t.string   "status"
    t.string   "event_url"
    t.text     "description"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["group_id"], :name => "index_events_on_group_id"
  add_index "events", ["meetup_id"], :name => "index_events_on_meetup_id", :unique => true

  create_table "groups", :force => true do |t|
    t.integer  "meetup_id"
    t.string   "link"
    t.integer  "organizer_id"
    t.string   "organizer_profile_url"
    t.string   "organizer_name"
    t.text     "description"
    t.string   "name"
    t.string   "photo_url"
    t.string   "group_urlname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_rsvps", :force => true do |t|
    t.integer  "member_id"
    t.string   "response"
    t.integer  "meetup_id"
    t.integer  "meetup_member_id"
    t.datetime "rsvp_updated"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "member_rsvps", ["event_id"], :name => "index_member_rsvps_on_event_id"
  add_index "member_rsvps", ["member_id"], :name => "index_member_rsvps_on_member_id"

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "meetup_id"
    t.string   "city"
    t.string   "state"
    t.string   "comment"
    t.string   "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
