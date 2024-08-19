# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :entity
  has_many :transactions

  def calculate_balance
    transactions.sum(:amount)
  end
end
