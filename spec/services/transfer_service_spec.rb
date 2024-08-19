# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransferService do
  let(:wallet1) { Wallet.create(entity: User.create(name: 'John Doe')) }
  let(:wallet2) { Wallet.create(entity: Team.create(name: 'Team Alpha')) }

  it 'transfers money between wallets' do
    TransferService.transfer_money(from_wallet: wallet1, to_wallet: wallet2, amount: 25.0)

    expect(wallet1.calculate_balance).to eq(-25.0)
    expect(wallet2.calculate_balance).to eq(25.0)
  end
end
