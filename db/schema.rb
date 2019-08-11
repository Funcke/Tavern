# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema 
# definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more 
# migrations you'll amass, the slower it'll run and the greater likelihood 
# for issues).

ActiveRecord::Schema.define(version: 20_190_726_173_544) do # rubocop:disable Metricks/BlockLength
  create_table 'levels', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'orders', force: :cascade do |t|
    t.boolean 'paid'
    t.integer 'table_id'
    t.integer 'product_id'
    t.integer 'organization_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['organization_id'], name: 'index_orders_on_organization_id'
    t.index ['product_id'], name: 'index_orders_on_product_id'
    t.index ['table_id'], name: 'index_orders_on_table_id'
  end

  create_table 'organizations', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'products', force: :cascade do |t|
    t.float 'preis'
    t.string 'name'
    t.boolean 'food'
    t.boolean 'drink'
    t.integer 'organization_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['organization_id'], name: 'index_products_on_organization_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.integer 'organization_id'
    t.integer 'level_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['level_id'], name: 'index_roles_on_level_id'
    t.index ['organization_id'], name: 'index_roles_on_organization_id'
  end

  create_table 'tables', force: :cascade do |t|
    t.integer 'nummer'
    t.integer 'organization_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['organization_id'], 'name: index_tables_on_organization_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.integer 'organization_id'
    t.integer 'role_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['organization_id'], name: 'index_users_on_organization_id'
    t.index ['role_id'], name: 'index_users_on_role_id'
  end
end
