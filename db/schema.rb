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

ActiveRecord::Schema.define(version: 20170925152459) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "namespace"
    t.text     "body",          limit: 65535
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sample"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "lat",        limit: 24
    t.float    "lng",        limit: 24
    t.integer  "user_id"
    t.index ["user_id"], name: "index_locations_on_user_id", using: :btree
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
    t.string   "sample_type"
    t.index ["user_id"], name: "index_readings_on_user_id", using: :btree
  end

  create_table "sample_ids", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sample_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sample_id"], name: "index_sample_ids_on_sample_id", using: :btree
    t.index ["user_id"], name: "index_sample_ids_on_user_id", using: :btree
  end

  create_table "samples", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "coverslip"
    t.integer  "user_id"
    t.integer  "reading_id"
    t.integer  "sample_id"
    t.integer  "location_id"
    t.integer  "sample_gp"
    t.integer  "reading_number"
    t.integer  "bacterial_number"
    t.string   "bacterial_size_shape"
    t.float    "bacterial_mean",                     limit: 24
    t.float    "bacterial_standard_deviation",       limit: 24
    t.integer  "bacterial_dilution"
    t.bigint   "no_bacteria_per_gram"
    t.bigint   "micrograms"
    t.float    "actinobacteria",                     limit: 24
    t.float    "actinobacteria_mean",                limit: 24
    t.float    "actinobacterial_standard_deviation", limit: 24
    t.integer  "actinobacteria_dilution"
    t.bigint   "actinobacteria_length_cm"
    t.bigint   "actinobacteria_micrograms"
    t.float    "fungi",                              limit: 24
    t.integer  "fungi_diameter"
    t.string   "fungi_colour"
    t.float    "fungi_mean",                         limit: 24
    t.float    "fungi_calculation",                  limit: 24
    t.float    "fungi_standard_deviation",           limit: 24
    t.integer  "fungi_dilution"
    t.float    "fungal_cm_length_for_calc",          limit: 24
    t.float    "fungi_average_diameter_in_um",       limit: 24
    t.float    "fungi_average_diameter_in_cm",       limit: 24
    t.bigint   "fungal_strands_cm"
    t.bigint   "fungi_micrograms"
    t.float    "oomycetes",                          limit: 24
    t.string   "oomycetes_colour"
    t.float    "oomycetes_mean",                     limit: 24
    t.float    "oomycetes_standard_deviation",       limit: 24
    t.integer  "oomycetes_dilution"
    t.float    "oomycetes_cm_length_for_calc",       limit: 24
    t.float    "oomycetes_average_diameter_in_um",   limit: 24
    t.float    "oomycetes_average_diameter_in_cm",   limit: 24
    t.bigint   "oomycetes_strands_cm"
    t.float    "oomycetes_calculation",              limit: 24
    t.integer  "oomycetes_diameter"
    t.float    "oomycetes_micrograms",               limit: 24
    t.integer  "flagellate"
    t.float    "flagellate_mean",                    limit: 24
    t.float    "flagellate_standard_deviation",      limit: 24
    t.integer  "flagellate_dilution"
    t.bigint   "flagellate_protozoa"
    t.integer  "amoebae"
    t.float    "amoebae_mean",                       limit: 24
    t.float    "amoebae_standard_deviation",         limit: 24
    t.integer  "amoebae_dilution"
    t.bigint   "amoebae_protozoa"
    t.integer  "ciliates"
    t.float    "ciliates_mean",                      limit: 24
    t.float    "ciliates_standard_deviation",        limit: 24
    t.integer  "ciliates_dilution"
    t.bigint   "ciliates_protozoa"
    t.integer  "nematodes_root"
    t.integer  "nematodes_predator"
    t.integer  "nematodes_fungi"
    t.integer  "nematodes_bacteria"
    t.float    "nematodes_mean",                     limit: 24
    t.integer  "nematodes_dilution"
    t.bigint   "nematodes_protozoa"
    t.text     "notes",                              limit: 65535
    t.float    "fb_biomass_ratio",                   limit: 24
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "entry_1_label"
    t.integer  "entry_2_label"
    t.integer  "entry_3_label"
    t.integer  "entry_4_label"
    t.index ["location_id"], name: "index_samples_on_location_id", using: :btree
    t.index ["reading_id"], name: "index_samples_on_reading_id", using: :btree
    t.index ["sample_gp"], name: "index_samples_on_sample_gp", using: :btree
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
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state_province_region"
    t.string   "zip_postcode"
    t.string   "country"
    t.string   "telephone"
    t.string   "mobile"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "locations", "users"
  add_foreign_key "readings", "users"
  add_foreign_key "samples", "locations"
  add_foreign_key "samples", "readings"
end
