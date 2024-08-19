# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:wallet) { Wallet.create(entity: User.create(name: 'John Doe'), balance: 100.0) }

  it 'creates a valid credit transaction' do
    transaction = Transaction.new(wallet: wallet, amount: 50.0, transaction_type: :credit,
                                  source_wallet_id: wallet.id)
    expect(transaction).to be_valid
  end
end
