# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do # rubocop:disable Metrics/BlockLength
  let(:user) do
    
  end

  it 'is valid' do
    expect(user.valid?).to be_truthy
  end

  it 'needs email' do
    expect(user.valid?).to be_truthy
    user.email = nil
    expect(user.valid?).to_not be_truthy
  end

  it 'needs valid email' do
    user.email = 'somebody@example.com'
    expect(user.valid?).to be_truthy
  end

  it 'needs username' do
    expect(user.valid?).to be_truthy
    user.username = nil
    expect(user.valid?).to_not be_truthy
  end

  it 'needs username with min size 5' do
    expect(user.valid?).to be_truthy
    user.username = 'u' * 4
    expect(user.valid?).to_not be_truthy
    user.username = 'u' * 5
    expect(user.valid?).to be_truthy
  end
end
