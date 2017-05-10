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

ActiveRecord::Schema.define(version: 20170507124252) do

  create_table "samples", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "reading_number"
    t.integer  "bacterial_number"
    t.string   "bacterial_size_shape"
    t.float    "bacterial_mean",                     limit: 24
    t.float    "bacterial_standard_deviation",       limit: 24
    t.integer  "bacterial_dilution"
    t.integer  "no_bacteria_per_gram"
    t.integer  "micrograms"
    t.integer  "actinobacteria"
    t.float    "actinobacteria_mean",                limit: 24
    t.float    "actinobacterial_standard_deviation", limit: 24
    t.integer  "actinobacteria_dilution"
    t.float    "actinobacteria_length_cm",           limit: 24
    t.integer  "actinobacteria_micrograms"
    t.integer  "fungi"
    t.integer  "fungi_diameter"
    t.string   "fungi_colour"
    t.integer  "fungi_calculation"
    t.float    "fungi_mean",                         limit: 24
    t.float    "fungi_standard_deviation",           limit: 24
    t.integer  "fungi_dilution"
    t.integer  "fungal_strands_cm"
    t.integer  "fungi_micrograms"
    t.integer  "oomycetes"
    t.integer  "oomycetes_diameter"
    t.string   "oomycetes_colour"
    t.integer  "oomycetes_calculation"
    t.float    "oomycetes_mean",                     limit: 24
    t.float    "oomycetes_standard_deviation",       limit: 24
    t.integer  "oomycetes_dilution"
    t.integer  "oomycetes_number_per_gram"
    t.float    "oomycetes_micrograms",               limit: 24
    t.integer  "flagellate"
    t.float    "flagellate_mean",                    limit: 24
    t.float    "flagellate_standard_deviation",      limit: 24
    t.integer  "flagellate_dilution"
    t.integer  "flagellate_protozoa"
    t.integer  "amoebae"
    t.float    "amoebae_mean",                       limit: 24
    t.float    "amoebae_standard_deviation",         limit: 24
    t.integer  "amoebae_dilution"
    t.integer  "amoebae_protozoa"
    t.integer  "ciliates"
    t.float    "ciliates_mean",                      limit: 24
    t.float    "ciliates_standard_deviation",        limit: 24
    t.integer  "ciliates_dilution"
    t.integer  "ciliates_protozoa"
    t.integer  "nematodes"
    t.float    "nematodes_mean",                     limit: 24
    t.integer  "nematodes_dilution"
    t.float    "nematodes_protozoa",                 limit: 24
    t.float    "fb_biomass_ratio",                   limit: 24
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "coverslip"
    t.integer  "user_id"
    t.integer  "sample_id"
    t.date     "sample_date"
    t.integer  "gps"
    t.index ["gps"], name: "index_samples_on_gps", using: :btree
    t.index ["sample_date"], name: "index_samples_on_sample_date", using: :btree
    t.index ["sample_id"], name: "index_samples_on_sample_id", using: :btree
    t.index ["user_id"], name: "index_samples_on_user_id", using: :btree
  end

end
