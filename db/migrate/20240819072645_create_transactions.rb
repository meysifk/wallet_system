# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :wallet, null: false, foreign_key: true
      t.decimal :amount
      t.integer :source_wallet_id
      t.integer :target_wallet_id
      t.integer :transaction_type

      t.timestamps
    end
  end
end
