# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150112004821) do

  create_table "annualincomes", force: true do |t|
    t.integer  "company_id"
    t.string   "currency"
    t.date     "period"
    t.decimal  "revenue"
    t.decimal  "otherrevenue"
    t.decimal  "totalrevenue"
    t.decimal  "totalcostofrevenue"
    t.decimal  "grossprofit"
    t.decimal  "generalexpense"
    t.decimal  "randd"
    t.decimal  "depreciation"
    t.decimal  "interestexpense"
    t.decimal  "unusualexpense"
    t.decimal  "otheroperatingexpense"
    t.decimal  "totaloperatingexpense"
    t.decimal  "operatingincome"
    t.decimal  "interestincome"
    t.decimal  "gainonsaleofasset"
    t.decimal  "otherincome"
    t.decimal  "incomebeforetax"
    t.decimal  "incomeaftertax"
    t.decimal  "minorityinterest"
    t.decimal  "equityinaffiliates"
    t.decimal  "netincomebeforeextraitem"
    t.decimal  "accountingchange"
    t.decimal  "discontinuedoperations"
    t.decimal  "extraitem"
    t.decimal  "netincome"
    t.decimal  "preferreddividends"
    t.decimal  "incomeavailabletocommonexclextra"
    t.decimal  "incomeavailabletocommoninclextra"
    t.decimal  "basicweightedaverageshares"
    t.decimal  "basicepsexclextraitems"
    t.decimal  "basicepsinclextraitems"
    t.decimal  "dilutionadjustment"
    t.decimal  "dilutedweightedaverageshares"
    t.decimal  "dilutedepsexclextraitems"
    t.decimal  "dilutedepsinclextraitems"
    t.decimal  "dividendspershare"
    t.decimal  "grossdividends"
    t.decimal  "netincomeafterstockexpense"
    t.decimal  "basicepsafterstockexpense"
    t.decimal  "dilutedepsafterstockexpense"
    t.decimal  "supplementdepreciation"
    t.decimal  "totalspecialitems"
    t.decimal  "normalizedincomebeforetaxes"
    t.decimal  "effectofspecialitemsonincometaxes"
    t.decimal  "incometaxesimpactofspecialitems"
    t.decimal  "normalizedincomeaftertaxes"
    t.decimal  "normalizedincomeavailtocommon"
    t.decimal  "basicnormalizedeps"
    t.decimal  "dilutednormalizedeps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end