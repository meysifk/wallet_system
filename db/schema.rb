# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_240_819_072_651) do
  create_table 'entities', force: :cascade do |t|
    t.string 'name'
    t.string 'type'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'sessions', force: :cascade do |t|
    t.integer 'entity_id', null: false
    t.string 'token'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['entity_id'], name: 'index_sessions_on_entity_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.integer 'wallet_id', null: false
    t.decimal 'amount'
    t.integer 'source_wallet_id'
    t.integer 'target_wallet_id'
    t.integer 'transaction_type'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['wallet_id'], name: 'index_transactions_on_wallet_id'
  end

  create_table 'wallets', force: :cascade do |t|
    t.integer 'entity_id', null: false
    t.decimal 'balance'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['entity_id'], name: 'index_wallets_on_entity_id'
  end

  add_foreign_key 'sessions', 'entities'
  add_foreign_key 'transactions', 'wallets'
  add_foreign_key 'wallets', 'entities'
end
