require 'account'

describe Account do
  let(:account) { Account.new }

  it 'accepts deposits' do
    account.deposit('100')

    expect(account.balance).to eq 100
  end
end