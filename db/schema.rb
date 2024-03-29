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

ActiveRecord::Schema.define(:version => 20111204125740) do

  create_table "users", :force => true do |t|
    t.string   "email",                                                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128,                                 :default => "",    :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                                                                               :null => false
    t.string   "last_name",                                                                                :null => false
    t.date     "dob"
    t.string   "password_salt"
    t.string   "gender"
    t.boolean  "is_admin",                                                              :default => false
    t.string   "address1",                                                                                 :null => false
    t.string   "address2"
    t.string   "city",                                                                                     :null => false
    t.string   "state",                                                                                    :null => false
    t.string   "zip",                                                                                      :null => false
    t.string   "country",                                                                                  :null => false
    t.string   "phone"
    t.string   "cell"
    t.decimal  "lat",                                   :precision => 15, :scale => 10
    t.decimal  "lng",                                   :precision => 15, :scale => 10
    t.string   "youtube_url"
    t.text     "about_me"
    t.string   "age"
    t.integer  "status",                                                                :default => 1
    t.string   "reject_reason"
    t.text     "admin_notes"
    t.boolean  "active",                                                                :default => true
    t.decimal  "rating_average_overall",                :precision => 6,  :scale => 2,  :default => 0.0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
