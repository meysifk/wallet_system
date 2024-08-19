# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
