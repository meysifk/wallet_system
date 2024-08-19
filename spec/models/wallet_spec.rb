# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Wallet, type: :model do
  let(:wallet) { Wallet.create!(entity: User.create!(name: 'John Doe')) }
  let(:other_wallet) { Wallet.create!(entity: User.create!(name: 'Jane Doe')) }

  it 'calculates balance correctly' do
    wallet.transactions.create!(amount: 100.0, transaction_type: :credit, source_wallet_id: other_wallet.id)
    wallet.transactions.create!(amount: -50.0, transaction_type: :debit, target_wallet_id: other_wallet.id)

    expect(wallet.calculate_balance).to eq(50.0)
  end
end
