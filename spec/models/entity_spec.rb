# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'should have a wallet' do
    user = User.create(name: 'John Doe')
    wallet = Wallet.create(entity: user, balance: 100.0)

    expect(user.wallet).to eq(wallet)
  end
end
