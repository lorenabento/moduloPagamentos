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

ActiveRecord::Schema.define(:version => 20130916123737) do

  create_table "aliquota", :force => true do |t|
    t.float    "empregador_perc"
    t.float    "empregado_perc"
    t.datetime "ano_base"
    t.boolean  "ativa"
    t.string   "user_at"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "app_types", :force => true do |t|
    t.string   "identifier", :null => false
    t.string   "label_key",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "app_types", ["identifier"], :name => "index_app_types_on_identifier"

  create_table "browser_versions", :force => true do |t|
    t.integer  "browser_id",                   :null => false
    t.string   "name",                         :null => false
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "browser_versions", ["browser_id"], :name => "fk_browser_versions_browsers"
  add_index "browser_versions", ["name", "browser_id"], :name => "index_browser_versions_on_name_and_browser_id"

  create_table "browsers", :force => true do |t|
    t.string   "name",                         :null => false
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "browsers", ["name"], :name => "index_browsers_on_name"

  create_table "certifications", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "certifications", ["name"], :name => "index_certifications_on_name"

  create_table "cities", :force => true do |t|
    t.integer  "state_id",   :null => false
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["state_id", "name"], :name => "index_cities_on_state_id_and_name"

  create_table "client_logos", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.integer  "contact_id",   :null => false
    t.string   "name",         :null => false
    t.string   "contact_name"
    t.string   "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contacts", ["city_id"], :name => "fk_contacts_cities"

  create_table "countries", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "countries", ["name"], :name => "index_countries_on_name"

  create_table "features", :force => true do |t|
    t.integer  "project_id",                   :null => false
    t.integer  "user_id"
    t.string   "name",                         :null => false
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "features", ["name"], :name => "index_features_on_name"
  add_index "features", ["project_id"], :name => "fk_features_projects"
  add_index "features", ["user_id"], :name => "fk_features_users"

  create_table "forum_messages", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "forum_messages", ["topic_id"], :name => "fk_forum_messages_topics"
  add_index "forum_messages", ["user_id"], :name => "fk_forum_messages_users"

  create_table "forum_topics", :force => true do |t|
    t.integer  "release_id"
    t.integer  "user_id"
    t.string   "title"
    t.integer  "messages_count", :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "forum_topics", ["release_id"], :name => "fk_forum_topics_releases"
  add_index "forum_topics", ["user_id"], :name => "fk_forum_topics_users"

  create_table "idioms", :force => true do |t|
    t.string   "identifier",                   :null => false
    t.string   "label_key",                    :null => false
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "idioms", ["identifier"], :name => "index_idioms_on_identifier"

  create_table "issue_attachments", :force => true do |t|
    t.integer  "issue_id",                :null => false
    t.string   "comment"
    t.string   "attachment_file_name",    :null => false
    t.string   "attachment_content_type", :null => false
    t.integer  "attachment_file_size",    :null => false
    t.datetime "attachment_updated_at",   :null => false
  end

  add_index "issue_attachments", ["issue_id"], :name => "fk_issue_attachments_issues"

  create_table "issue_comments", :force => true do |t|
    t.integer  "issue_id",   :null => false
    t.integer  "user_id",    :null => false
    t.text     "message",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "issue_comments", ["issue_id"], :name => "fk_issue_comments_issues"
  add_index "issue_comments", ["user_id"], :name => "fk_issue_comments_users"

  create_table "issue_status_actions", :force => true do |t|
    t.integer  "resulting_status_id"
    t.string   "action"
    t.string   "action_key"
    t.integer  "position"
    t.boolean  "comment_required",    :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "issue_status_actions", ["position"], :name => "index_issue_status_actions_on_position"
  add_index "issue_status_actions", ["resulting_status_id"], :name => "fk_issue_status_actions_issue_statuses"

  create_table "issue_status_transitions", :id => false, :force => true do |t|
    t.integer "issue_status_id",        :null => false
    t.integer "issue_status_action_id", :null => false
  end

  add_index "issue_status_transitions", ["issue_status_action_id"], :name => "fk_issue_statuses_issue_status_actions1"
  add_index "issue_status_transitions", ["issue_status_id", "issue_status_action_id"], :name => "index_on_issue_status_id_issue_status_action_id", :unique => true

  create_table "issue_statuses", :force => true do |t|
    t.string   "identifier", :null => false
    t.string   "label_key",  :null => false
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "issue_statuses", ["position"], :name => "index_issue_statuses_on_position"

  create_table "issue_type_counts", :force => true do |t|
    t.integer  "ranking_id"
    t.integer  "issue_type_id"
    t.integer  "total_count"
    t.integer  "approved_count"
    t.integer  "reproved_count"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "issue_type_counts", ["ranking_id"], :name => "fk_issue_type_counts_rankings"

  create_table "issue_types", :force => true do |t|
    t.string   "identifier",                                                    :null => false
    t.string   "label_key",                                                     :null => false
    t.decimal  "value",        :precision => 10, :scale => 2,                   :null => false
    t.decimal  "client_value", :precision => 10, :scale => 2,                   :null => false
    t.boolean  "active",                                      :default => true
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  add_index "issue_types", ["value"], :name => "index_issue_types_on_value"

  create_table "issue_values", :force => true do |t|
    t.integer  "release_id",                                   :null => false
    t.integer  "issue_type_id",                                :null => false
    t.decimal  "value",         :precision => 10, :scale => 2, :null => false
    t.decimal  "client_value",  :precision => 10, :scale => 2, :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "issue_values", ["issue_type_id"], :name => "fk_issue_values_issue_types"
  add_index "issue_values", ["release_id", "issue_type_id"], :name => "index_issue_values_on_release_id_and_issue_type_id", :unique => true

  create_table "issues", :force => true do |t|
    t.integer  "release_id",                        :null => false
    t.integer  "author_id",                         :null => false
    t.integer  "validator_id"
    t.integer  "client_id"
    t.integer  "feature_id",                        :null => false
    t.integer  "type_id",                           :null => false
    t.integer  "status_id",                         :null => false
    t.integer  "os_version_id"
    t.integer  "browser_version_id"
    t.integer  "mobile_model_id"
    t.integer  "test_case_run_id"
    t.integer  "number",                            :null => false
    t.string   "title",                             :null => false
    t.text     "description",                       :null => false
    t.text     "action_performed",                  :null => false
    t.text     "expected_results",                  :null => false
    t.text     "additional_info"
    t.integer  "attachments_count",  :default => 0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "issues", ["author_id"], :name => "fk_issues_authors"
  add_index "issues", ["browser_version_id"], :name => "fk_issues_browser_versions"
  add_index "issues", ["feature_id"], :name => "fk_issues_features"
  add_index "issues", ["mobile_model_id"], :name => "fk_issues_mobile_models"
  add_index "issues", ["os_version_id"], :name => "fk_issues_os_versions"
  add_index "issues", ["release_id", "number"], :name => "index_issues_on_release_id_and_number", :unique => true
  add_index "issues", ["status_id"], :name => "fk_issues_statuses"
  add_index "issues", ["test_case_run_id"], :name => "index_issues_on_test_case_run_id"
  add_index "issues", ["type_id", "release_id"], :name => "index_issues_on_type_id_and_release_id"
  add_index "issues", ["validator_id"], :name => "fk_issues_validators"

  create_table "knowledge_areas", :force => true do |t|
    t.string   "identifier", :null => false
    t.string   "label_key",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "knowledge_areas", ["identifier"], :name => "index_knowledge_areas_on_identifier"

  create_table "leads", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "email"
    t.string   "phone"
    t.string   "site"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mobile_makers", :force => true do |t|
    t.string   "name",                         :null => false
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "mobile_makers", ["name"], :name => "index_mobile_makers_on_name"

  create_table "mobile_models", :force => true do |t|
    t.integer  "mobile_maker_id",                   :null => false
    t.string   "name",                              :null => false
    t.boolean  "active",          :default => true
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "mobile_models", ["mobile_maker_id"], :name => "fk_mobile_models_mobile_makers"
  add_index "mobile_models", ["name", "mobile_maker_id"], :name => "index_mobile_models_on_name_and_mobile_maker_id"

  create_table "operating_systems", :force => true do |t|
    t.integer  "app_type_id",                   :null => false
    t.string   "name",                          :null => false
    t.boolean  "active",      :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "operating_systems", ["app_type_id", "name"], :name => "index_operating_systems_on_app_type_id_and_name"

  create_table "os_versions", :force => true do |t|
    t.integer  "operating_system_id",                   :null => false
    t.string   "name",                                  :null => false
    t.boolean  "active",              :default => true
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "os_versions", ["operating_system_id", "name"], :name => "index_os_versions_on_operating_system_id_and_name"

  create_table "pagamentos", :force => true do |t|
    t.integer  "users_id",                                         :null => false
    t.integer  "projects_id",                                      :null => false
    t.integer  "releases_id",                                      :null => false
    t.string   "id_transacao_moip"
    t.decimal  "valor",             :precision => 10, :scale => 2
    t.decimal  "valor_transacao",   :precision => 10, :scale => 2
    t.decimal  "inss_base2",        :precision => 10, :scale => 2
    t.decimal  "inss_autonomo",     :precision => 10, :scale => 2
    t.date     "data_pag_moip"
    t.date     "data_pag_inss"
    t.date     "ano_base_aliq"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "pagamentos", ["projects_id"], :name => "fk_pagamentos_releases"
  add_index "pagamentos", ["users_id"], :name => "fk_pagamentos_users"

  create_table "plans", :force => true do |t|
    t.string   "identifier",                   :null => false
    t.string   "label_key",                    :null => false
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "plans", ["identifier"], :name => "index_plans_on_identifier"

  create_table "presses", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_roles", :force => true do |t|
    t.string   "identifier",                   :null => false
    t.string   "label_key",                    :null => false
    t.integer  "position"
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "project_users", :force => true do |t|
    t.integer  "project_id", :null => false
    t.integer  "user_id",    :null => false
    t.integer  "role_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "project_users", ["project_id", "user_id"], :name => "index_project_users_on_project_id_and_user_id", :unique => true
  add_index "project_users", ["role_id"], :name => "fk_project_users_project_roles"
  add_index "project_users", ["user_id"], :name => "fk_project_users_users"

  create_table "projects", :force => true do |t|
    t.integer  "plan_id"
    t.integer  "app_type_id",                                                        :null => false
    t.integer  "company_id"
    t.string   "name",                                                               :null => false
    t.string   "identifier",                                                         :null => false
    t.integer  "releases_count",                                      :default => 0
    t.string   "site"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.text     "description",                                                        :null => false
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
    t.decimal  "test_spec_value",      :precision => 10, :scale => 2
  end

  add_index "projects", ["app_type_id"], :name => "fk_projects_app_types"
  add_index "projects", ["company_id"], :name => "fk_projects_companies"
  add_index "projects", ["identifier"], :name => "index_projects_on_identifier", :unique => true
  add_index "projects", ["name"], :name => "index_projects_on_name"
  add_index "projects", ["plan_id"], :name => "fk_projects_plans"

  create_table "rankings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "year"
    t.integer  "month"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rankings", ["user_id"], :name => "fk_rankings_users"

  create_table "release_attachments", :force => true do |t|
    t.integer  "release_id",              :null => false
    t.string   "attachment_file_name",    :null => false
    t.string   "attachment_content_type", :null => false
    t.integer  "attachment_file_size",    :null => false
    t.datetime "attachment_updated_at",   :null => false
  end

  add_index "release_attachments", ["release_id"], :name => "fk_release_attachments_releases"

  create_table "release_roles", :force => true do |t|
    t.string   "identifier",                   :null => false
    t.string   "label_key",                    :null => false
    t.integer  "position"
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "release_roles", ["identifier"], :name => "index_release_roles_on_identifier"
  add_index "release_roles", ["position"], :name => "index_release_roles_on_position"

  create_table "release_statuses", :force => true do |t|
    t.string   "identifier", :null => false
    t.string   "label_key",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "release_statuses", ["identifier"], :name => "index_release_statuses_on_identifier"

  create_table "release_users", :force => true do |t|
    t.integer  "release_id", :null => false
    t.integer  "user_id",    :null => false
    t.integer  "role_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "release_users", ["release_id", "user_id"], :name => "index_release_users_on_release_id_and_user_id", :unique => true
  add_index "release_users", ["role_id"], :name => "fk_release_users_release_roles"
  add_index "release_users", ["user_id"], :name => "fk_release_users_users"

  create_table "releases", :force => true do |t|
    t.integer  "project_id",                                                             :null => false
    t.integer  "status_id",                                                              :null => false
    t.string   "name",                                                                   :null => false
    t.string   "identifier",                                                             :null => false
    t.integer  "issues_count",                                        :default => 0
    t.decimal  "budget",               :precision => 10, :scale => 2
    t.integer  "vacancies",                                           :default => 0
    t.datetime "closing_date"
    t.string   "site"
    t.text     "description"
    t.text     "instructions"
    t.text     "rules"
    t.text     "notifications"
    t.boolean  "auto_pause",                                          :default => false
    t.decimal  "auto_pause_tolerance", :precision => 3,  :scale => 2, :default => 0.0
    t.string   "pause_message"
    t.boolean  "championship",                                        :default => false
    t.datetime "created_at",                                                             :null => false
    t.datetime "updated_at",                                                             :null => false
    t.decimal  "test_run_value",       :precision => 10, :scale => 2
  end

  add_index "releases", ["project_id", "identifier"], :name => "index_releases_on_project_id_and_identifier", :unique => true
  add_index "releases", ["project_id", "name"], :name => "index_releases_on_project_id_and_name"
  add_index "releases", ["status_id"], :name => "fk_releases_status"

  create_table "releases_browser_versions", :id => false, :force => true do |t|
    t.integer "release_id",         :null => false
    t.integer "browser_version_id", :null => false
  end

  add_index "releases_browser_versions", ["browser_version_id"], :name => "fk_releases_browser_versions1"
  add_index "releases_browser_versions", ["release_id", "browser_version_id"], :name => "index_on_release_id_browser_version_id", :unique => true

  create_table "releases_mobile_models", :id => false, :force => true do |t|
    t.integer "release_id",      :null => false
    t.integer "mobile_model_id", :null => false
  end

  add_index "releases_mobile_models", ["mobile_model_id"], :name => "fk_releases_mobile_models1"
  add_index "releases_mobile_models", ["release_id", "mobile_model_id"], :name => "index_on_release_id_mobile_model_id", :unique => true

  create_table "releases_os_versions", :id => false, :force => true do |t|
    t.integer "release_id",    :null => false
    t.integer "os_version_id", :null => false
  end

  add_index "releases_os_versions", ["os_version_id"], :name => "fk_releases_os_versions1"
  add_index "releases_os_versions", ["release_id", "os_version_id"], :name => "index_on_release_id_os_version_id", :unique => true

  create_table "school_degrees", :force => true do |t|
    t.string   "identifier",                   :null => false
    t.string   "label_key",                    :null => false
    t.integer  "position"
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "school_degrees", ["position"], :name => "index_school_degrees_on_position"

  create_table "states", :force => true do |t|
    t.integer  "country_id", :null => false
    t.string   "name",       :null => false
    t.string   "acronym",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "states", ["acronym"], :name => "index_states_on_acronym"
  add_index "states", ["country_id"], :name => "fk_states_countries"
  add_index "states", ["name"], :name => "index_states_on_name"

  create_table "system_roles", :force => true do |t|
    t.string   "identifier",                   :null => false
    t.string   "label_key",                    :null => false
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "system_roles", ["identifier"], :name => "index_system_roles_on_identifier"

  create_table "test_case_attachments", :force => true do |t|
    t.integer  "test_case_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "test_case_attachments", ["test_case_id"], :name => "fk_test_case_attachments_test_cases"

  create_table "test_case_comments", :force => true do |t|
    t.integer  "test_case_id", :null => false
    t.integer  "user_id",      :null => false
    t.text     "message",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "test_case_comments", ["test_case_id"], :name => "fk_test_case_comments_test_cases"
  add_index "test_case_comments", ["user_id"], :name => "fk_test_case_comments_users"

  create_table "test_case_run_comment_attachments", :force => true do |t|
    t.integer  "test_case_run_comment_id", :null => false
    t.string   "comment"
    t.string   "attachment_file_name",     :null => false
    t.string   "attachment_content_type",  :null => false
    t.integer  "attachment_file_size",     :null => false
    t.datetime "attachment_updated_at",    :null => false
  end

  add_index "test_case_run_comment_attachments", ["test_case_run_comment_id"], :name => "fk_test_case_run_comment_attachments_test_case_run_comments"

  create_table "test_case_run_comments", :force => true do |t|
    t.integer  "test_case_run_id",                 :null => false
    t.integer  "user_id",                          :null => false
    t.text     "message"
    t.integer  "attachments_count", :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "test_case_run_comments", ["test_case_run_id"], :name => "fk_test_case_run_comments_test_case_runs"
  add_index "test_case_run_comments", ["user_id"], :name => "fk_test_case_run_comments_users"

  create_table "test_case_run_status_actions", :force => true do |t|
    t.integer  "resulting_status_id"
    t.string   "action"
    t.string   "action_key"
    t.integer  "position"
    t.boolean  "comment_required"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "test_case_run_status_actions", ["position"], :name => "index_test_case_run_status_actions_on_position"
  add_index "test_case_run_status_actions", ["resulting_status_id"], :name => "fk_test_case_run_status_actions_test_case_run_statuses"

  create_table "test_case_run_statuses", :force => true do |t|
    t.string   "identifier"
    t.string   "label_key"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "test_case_run_step_statuses", :force => true do |t|
    t.string   "identifier"
    t.string   "label_key"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "test_case_run_steps", :force => true do |t|
    t.integer  "test_case_run_id"
    t.integer  "test_case_step_id"
    t.integer  "status_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "test_case_runs", :force => true do |t|
    t.integer  "tester_id"
    t.integer  "status_id"
    t.integer  "release_id"
    t.integer  "test_plan_case_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "test_case_runs", ["tester_id", "release_id", "test_plan_case_id"], :name => "index_test_case_runs_on_tester_and_release_and_test_plan_case", :unique => true

  create_table "test_case_status_actions", :force => true do |t|
    t.integer  "resulting_status_id"
    t.string   "action"
    t.string   "action_key"
    t.integer  "position"
    t.boolean  "comment_required",    :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "test_case_status_actions", ["position"], :name => "index_test_case_status_actions_on_position"
  add_index "test_case_status_actions", ["resulting_status_id"], :name => "fk_test_case_status_actions_test_case_statuses"

  create_table "test_case_status_transitions", :id => false, :force => true do |t|
    t.integer "test_case_status_id",        :null => false
    t.integer "test_case_status_action_id", :null => false
  end

  add_index "test_case_status_transitions", ["test_case_status_action_id"], :name => "fk_test_case_statuses_test_case_status_actions1"
  add_index "test_case_status_transitions", ["test_case_status_id", "test_case_status_action_id"], :name => "index_on_test_case_status_id_test_case_status_action_id", :unique => true

  create_table "test_case_statuses", :force => true do |t|
    t.string   "identifier"
    t.string   "label_key"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "test_case_steps", :force => true do |t|
    t.integer  "test_case_id"
    t.integer  "number"
    t.string   "name"
    t.string   "expected_result"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "test_case_steps", ["test_case_id", "number"], :name => "index_test_case_steps_on_test_case_id_and_number", :unique => true

  create_table "test_cases", :force => true do |t|
    t.integer  "project_id"
    t.integer  "feature_id"
    t.integer  "status_id"
    t.integer  "author_id"
    t.integer  "validator_id"
    t.integer  "client_id"
    t.integer  "number"
    t.integer  "version_number"
    t.string   "title"
    t.text     "description"
    t.text     "precondition"
    t.decimal  "estimated_time", :precision => 5, :scale => 2
    t.boolean  "active",                                       :default => true
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
  end

  add_index "test_cases", ["author_id"], :name => "fk_test_cases_authors"
  add_index "test_cases", ["client_id"], :name => "fk_test_cases_clients"
  add_index "test_cases", ["feature_id"], :name => "fk_test_cases_features"
  add_index "test_cases", ["project_id", "number", "version_number"], :name => "index_test_cases_on_project_id_and_number_and_version_number", :unique => true
  add_index "test_cases", ["status_id"], :name => "fk_test_cases_statuses"
  add_index "test_cases", ["validator_id"], :name => "fk_test_cases_validators"

  create_table "test_plan_case_testers", :force => true do |t|
    t.integer  "tester_id",         :null => false
    t.integer  "test_plan_case_id", :null => false
    t.integer  "release_id",        :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "test_plan_case_testers", ["release_id"], :name => "fk_test_plan_case_testers_releases"
  add_index "test_plan_case_testers", ["test_plan_case_id"], :name => "fk_test_plan_case_testers_test_plan_cases"
  add_index "test_plan_case_testers", ["tester_id", "test_plan_case_id", "release_id"], :name => "index_test_plan_case_testers_on_tester_test_plan_case_release", :unique => true

  create_table "test_plan_cases", :force => true do |t|
    t.integer  "test_plan_id", :null => false
    t.integer  "test_case_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "test_plan_cases", ["test_case_id"], :name => "fk_test_plans_test_cases1"
  add_index "test_plan_cases", ["test_plan_id", "test_case_id"], :name => "index_test_plan_cases_on_test_plan_id_and_test_case_id", :unique => true

  create_table "test_plans", :force => true do |t|
    t.integer  "project_id"
    t.integer  "number"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "test_plans", ["project_id", "name"], :name => "index_test_plans_on_project_id_and_name", :unique => true

  create_table "testimonials", :force => true do |t|
    t.text     "testimonial"
    t.string   "author"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id",                 :null => false
    t.integer  "school_degree_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "cpf"
    t.string   "occupation"
    t.string   "company"
    t.string   "position"
    t.string   "moip_user"
    t.string   "pis"
    t.string   "certification"
    t.date     "birth_date"
    t.string   "gender"
    t.integer  "years_testing_sw"
    t.integer  "unit_testing"
    t.integer  "exploratory_testing"
    t.integer  "test_automation"
    t.integer  "performance_testing"
    t.integer  "usability_testing"
    t.integer  "test_project_management"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "user_profiles", ["certification"], :name => "index_user_profiles_on_certification"
  add_index "user_profiles", ["company"], :name => "index_user_profiles_on_company"
  add_index "user_profiles", ["occupation"], :name => "index_user_profiles_on_occupation"
  add_index "user_profiles", ["position"], :name => "index_user_profiles_on_position"
  add_index "user_profiles", ["school_degree_id"], :name => "fk_user_profiles_school_degrees"
  add_index "user_profiles", ["user_id"], :name => "fk_user_profiles_users"

  create_table "user_profiles_certifications", :id => false, :force => true do |t|
    t.integer "user_profile_id",  :null => false
    t.integer "certification_id", :null => false
  end

  add_index "user_profiles_certifications", ["certification_id"], :name => "fk_user_profiles_certifications1"
  add_index "user_profiles_certifications", ["user_profile_id", "certification_id"], :name => "index_on_user_profile_id_certification_id", :unique => true

  create_table "user_profiles_idioms", :id => false, :force => true do |t|
    t.integer "user_profile_id", :null => false
    t.integer "idiom_id",        :null => false
  end

  add_index "user_profiles_idioms", ["idiom_id"], :name => "fk_user_profiles_idioms1"
  add_index "user_profiles_idioms", ["user_profile_id", "idiom_id"], :name => "index_on_user_profile_id_idiom_id", :unique => true

  create_table "user_profiles_knowledge_areas", :id => false, :force => true do |t|
    t.integer "user_profile_id",   :null => false
    t.integer "knowledge_area_id", :null => false
  end

  add_index "user_profiles_knowledge_areas", ["knowledge_area_id"], :name => "fk_user_profiles_knowledge_areas1"
  add_index "user_profiles_knowledge_areas", ["user_profile_id", "knowledge_area_id"], :name => "index_on_user_profile_id_knowledge_area_id", :unique => true

  create_table "user_profiles_mobile_models", :id => false, :force => true do |t|
    t.integer "user_profile_id", :null => false
    t.integer "mobile_model_id", :null => false
  end

  add_index "user_profiles_mobile_models", ["mobile_model_id"], :name => "fk_user_profiles_mobile_models1"
  add_index "user_profiles_mobile_models", ["user_profile_id", "mobile_model_id"], :name => "index_on_user_profile_id_mobile_model_id", :unique => true

  create_table "user_profiles_os_versions", :id => false, :force => true do |t|
    t.integer "user_profile_id", :null => false
    t.integer "os_version_id",   :null => false
  end

  add_index "user_profiles_os_versions", ["os_version_id"], :name => "fk_user_profiles_os_versions1"
  add_index "user_profiles_os_versions", ["user_profile_id", "os_version_id"], :name => "index_on_user_profile_id_os_version_id", :unique => true

  create_table "user_statuses", :force => true do |t|
    t.string   "identifier", :null => false
    t.string   "label_key",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_statuses", ["identifier"], :name => "index_user_statuses_on_identifier"

  create_table "users", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "system_role_id"
    t.integer  "system_idiom_id",        :null => false
    t.integer  "status_id",              :null => false
    t.integer  "company_id"
    t.string   "username",               :null => false
    t.string   "email",                  :null => false
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "auth_token",             :null => false
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "last_login_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "users", ["auth_token"], :name => "index_users_on_auth_token", :unique => true
  add_index "users", ["company_id"], :name => "fk_users_companies"
  add_index "users", ["contact_id"], :name => "fk_users_contacts"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["password_reset_token"], :name => "index_users_on_password_reset_token", :unique => true
  add_index "users", ["status_id"], :name => "fk_users_statuses"
  add_index "users", ["system_idiom_id"], :name => "fk_users_idioms"
  add_index "users", ["system_role_id"], :name => "fk_users_system_roles"
  add_index "users", ["username"], :name => "index_users_on_username"

  create_table "versions", :force => true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "user_name"
    t.text     "modifications"
    t.integer  "number"
    t.integer  "reverted_from"
    t.string   "tag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["tag"], :name => "index_versions_on_tag"
  add_index "versions", ["user_id", "user_type"], :name => "index_versions_on_user_id_and_user_type"
  add_index "versions", ["user_name"], :name => "index_versions_on_user_name"
  add_index "versions", ["versioned_id", "versioned_type"], :name => "index_versions_on_versioned_id_and_versioned_type"

end
