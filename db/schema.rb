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

ActiveRecord::Schema.define(version: 2019_08_11_104732) do

  create_table "allergenics", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "allergenics_ingridients", id: false, force: :cascade do |t|
    t.integer "ingridient_id", null: false
    t.integer "allergenic_id", null: false
    t.index ["allergenic_id", "ingridient_id"], name: "allergenic_ingridient"
    t.index ["ingridient_id", "allergenic_id"], name: "ingridient_allergenic"
  end

  create_table "allergenics_products", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "allergenic_id", null: false
    t.index ["allergenic_id", "product_id"], name: "product_allergene"
    t.index ["product_id", "allergenic_id"], name: "allergene_product"
  end

  create_table "ingridients", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_groups", force: :cascade do |t|
    t.string "number"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_order_groups_on_organization_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "paid"
    t.integer "table_id"
    t.integer "product_id"
    t.integer "order_group_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_group_id"], name: "index_orders_on_order_group_id"
    t.index ["organization_id"], name: "index_orders_on_organization_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["table_id"], name: "index_orders_on_table_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.float "price"
    t.string "name"
    t.boolean "food"
    t.boolean "drink"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_products_on_organization_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "organization_id"
    t.integer "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_roles_on_level_id"
    t.index ["organization_id"], name: "index_roles_on_organization_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "nummer"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_tables_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "organization_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
