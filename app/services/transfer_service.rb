# frozen_string_literal: true

class TransferService
  def self.transfer_money(from_wallet:, to_wallet:, amount:)
    ActiveRecord::Base.transaction do
      from_wallet.transactions.create!(amount: -amount, transaction_type: :debit, target_wallet_id: to_wallet.id)
      to_wallet.transactions.create!(amount: amount, transaction_type: :credit, source_wallet_id: from_wallet.id)
    end
  end
end
