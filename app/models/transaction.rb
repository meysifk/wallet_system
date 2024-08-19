# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :wallet
  enum transaction_type: { credit: 0, debit: 1 }

  validates :amount, presence: true
  validates :transaction_type, presence: true

  validate :valid_transaction?

  private

  def valid_transaction?
    if credit? && source_wallet_id.nil?
      errors.add(:source_wallet, 'cannot be nil for a credit transaction')
    elsif debit? && target_wallet_id.nil?
      errors.add(:target_wallet, 'cannot be nil for a debit transaction')
    end
  end
end
