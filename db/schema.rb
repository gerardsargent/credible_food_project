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

ActiveRecord::Schema.define(version: 20170626174936) do

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "lat",        limit: 24
    t.float    "lng",        limit: 24
    t.integer  "users_id"
    t.index ["users_id"], name: "index_locations_on_users_id", using: :btree
  end

  create_table "readings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "client"
    t.string   "organisation"
    t.datetime "date_collected"
    t.datetime "date_observed"
    t.string   "location"
    t.string   "plants_present"
    t.string   "plants_desired"
    t.text     "other_notes",    limit: 65535
    t.string   "observed_by"
    t.integer  "lt_id"
    t.integer  "cust_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_readings_on_user_id", using: :btree
  end

  create_table "samples", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "sample_id"
    t.integer  "reading_number"
    t.integer  "bacterial_number"
    t.string   "bacterial_size_shape"
    t.float    "bacterial_mean",                     limit: 24
    t.float    "bacterial_standard_deviation",       limit: 24
    t.integer  "bacterial_dilution"
    t.bigint   "no_bacteria_per_gram"
    t.float    "actinobacteria_mean",                limit: 24
    t.float    "actinobacterial_standard_deviation", limit: 24
    t.integer  "actinobacteria_dilution"
    t.integer  "fungi_diameter"
    t.string   "fungi_colour"
    t.integer  "fungi_calculation"
    t.float    "fungi_mean",                         limit: 24
    t.float    "fungi_standard_deviation",           limit: 24
    t.integer  "fungi_dilution"
    t.integer  "oomycetes_diameter"
    t.string   "oomycetes_colour"
    t.integer  "oomycetes_calculation"
    t.float    "oomycetes_mean",                     limit: 24
    t.float    "oomycetes_standard_deviation",       limit: 24
    t.integer  "oomycetes_dilution"
    t.integer  "flagellate"
    t.float    "flagellate_mean",                    limit: 24
    t.float    "flagellate_standard_deviation",      limit: 24
    t.integer  "flagellate_dilution"
    t.integer  "amoebae"
    t.float    "amoebae_mean",                       limit: 24
    t.float    "amoebae_standard_deviation",         limit: 24
    t.integer  "amoebae_dilution"
    t.integer  "ciliates"
    t.float    "ciliates_mean",                      limit: 24
    t.float    "ciliates_standard_deviation",        limit: 24
    t.integer  "ciliates_dilution"
    t.integer  "nematodes"
    t.float    "nematodes_mean",                     limit: 24
    t.integer  "nematodes_dilution"
    t.float    "fb_biomass_ratio",                   limit: 24
    t.date     "sample_date"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "coverslip"
    t.float    "fungal_cm_length_for_calc",          limit: 24
    t.float    "fungi_average_diameter_in_um",       limit: 24
    t.float    "fungi_average_diameter_in_cm",       limit: 24
    t.float    "oomycetes_cm_length_for_calc",       limit: 24
    t.float    "oomycetes_average_diameter_in_um",   limit: 24
    t.float    "oomycetes_average_diameter_in_cm",   limit: 24
    t.float    "gps",                                limit: 24
    t.bigint   "micrograms"
    t.bigint   "actinobacteria_length_cm"
    t.bigint   "actinobacteria_micrograms"
    t.bigint   "fungal_strands_cm"
    t.bigint   "fungi_micrograms"
    t.bigint   "oomycetes_number_per_gram"
    t.bigint   "oomycetes_micrograms"
    t.bigint   "flagellate_protozoa"
    t.bigint   "amoebae_protozoa"
    t.bigint   "ciliates_protozoa"
    t.bigint   "nematodes_protozoa"
    t.bigint   "oomycetes_strands_cm"
    t.integer  "location_id"
    t.integer  "reading_id"
    t.float    "actinobacteria",                     limit: 24
    t.float    "fungi",                              limit: 24
    t.float    "oomycetes",                          limit: 24
    t.integer  "bacterial_nematodes"
    t.integer  "fungal_nematodes"
    t.integer  "predator_nematodes"
    t.integer  "root_nematodes"
    t.text     "notes",                              limit: 65535
    t.index ["location_id"], name: "index_samples_on_location_id", using: :btree
    t.index ["reading_id"], name: "index_samples_on_reading_id", using: :btree
    t.index ["sample_date"], name: "index_samples_on_sample_date", using: :btree
    t.index ["sample_id"], name: "index_samples_on_sample_id", using: :btree
    t.index ["user_id"], name: "index_samples_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "roles"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "locations", "users", column: "users_id"
  add_foreign_key "readings", "users"
  add_foreign_key "samples", "locations"
  add_foreign_key "samples", "readings"
end
