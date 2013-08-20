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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130814111702) do

  create_table "aliquota", :force => true do |t|
    t.float    "empregador_perc"
    t.float    "empregado_perc"
    t.datetime "ano_base"
    t.boolean  "ativa"
    t.string   "user_at"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "aliquotas", :force => true do |t|
    t.float    "empregador_perc",               :null => false
    t.float    "empregado_perc",                :null => false
    t.date     "ano_base",                      :null => false
    t.integer  "ativa",                         :null => false
    t.string   "user",            :limit => 20
    t.datetime "created_at"
    t.datetime "update_at"
  end

  create_table "app_types", :force => true do |t|
    t.string   "identifier", :null => false
    t.string   "label_key",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "app_types", ["identifier"], :name => "index_app_types_on_identifier"

  create_table "browser_versions", :force => true do |t|
    t.integer  "browser_id",                   :null => false
    t.string   "name",                         :null => false
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "browser_versions", ["browser_id"], :name => "fk_browser_versions_browsers"
  add_index "browser_versions", ["name", "browser_id"], :name => "index_browser_versions_on_name_and_browser_id"

  create_table "browsers", :force => true do |t|
    t.string   "name",                         :null => false
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "browsers", ["name"], :name => "index_browsers_on_name"

  create_table "certifications", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "certifications", ["name"], :name => "index_certifications_on_name"

  create_table "cities", :force => true do |t|
    t.integer  "state_id",   :null => false
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id", "name"], :name => "index_cities_on_state_id_and_name"

  create_table "client_logos", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.integer  "contact_id",   :null => false
    t.string   "name",         :null => false
    t.string   "contact_name"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["contact_id"], :name => "fk_companies_contacts"
  add_index "companies", ["name"], :name => "index_companies_on_name"

  create_table "contacts", :force => true do |t|
    t.integer  "city_id"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "district"
    t.string   "zipcode"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "phone3"
    t.string   "email1"
    t.string   "email2"
    t.string   "site"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["city_id"], :name => "fk_contacts_cities"

  create_table "countries", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["name"], :name => "index_countries_on_name"

  create_table "crowd_consulta_certificacoes", :id => false, :force => true do |t|
    t.integer "user_id",     :null => false
    t.string  "outra"
    t.string  "selecionado"
  end

  create_table "crowd_consulta_perfil_geral", :id => false, :force => true do |t|
    t.integer "id",                                    :default => 0, :null => false
    t.string  "birth_date",              :limit => 10
    t.integer "age"
    t.string  "gender"
    t.integer "years_testing_sw"
    t.integer "unit_testing"
    t.integer "exploratory_testing"
    t.integer "test_automation"
    t.integer "performance_testing"
    t.integer "usability_testing"
    t.integer "test_project_management"
    t.string  "knowledge_area"
    t.string  "certification"
    t.string  "state",                                                :null => false
    t.string  "city",                                                 :null => false
  end

