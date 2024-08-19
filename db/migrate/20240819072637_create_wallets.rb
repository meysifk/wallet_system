# frozen_string_literal: true

class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.references :entity, null: false, foreign_key: true
      t.decimal :balance

      t.timestamps
    end
  end
end
