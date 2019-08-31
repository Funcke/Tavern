# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  subject { described_class.new(
      name: "Larry's Schnitzel House",
      phone: '+436506300112',
      mail: 'somebody@example.com',
      street: '12 Downing Street',
      town: 'London',
      zipcode: '4210',
      VAT: 'ATU99999999',
      legal_name: 'Larriard Hannes',
      homepage: 'example.com',
      currency: 'EUR'
  ) }
  it 'is valid after initialization' do
    expect(subject).to be_valid
  end

  it 'needs a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  context 'has a name that' do
    it 'has to be longer than 4 chars' do
        subject.name = 'a' * 3
        expect(subject).to_not be_valid
        subject.name = 'a' * 4
        expect(subject).to be_valid
    end

    it 'has to be shorter than 61 chars' do
        subject.name = 'a' * 61
        expect(subject).to_not be_valid
        subject.name = 'a' * 60
        expect(subject).to be_valid
    end

    it 'is unique' do
        should validate_uniqueness_of(:name)
    end
  end

  it 'needs a phone number' do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

  context 'has a phone number that' do
    it 'has a valid format' do
      subject.phone = 'penis'
      expect(subject).to_not be_valid
      subject.phone = '+436506300112'
      expect(subject).to be_valid
    end

    it 'is unique'do
        should validate_uniqueness_of(:phone).case_insensitive
    end
  end

  it 'needs an email address' do
    subject.mail = nil
    expect(subject).to_not be_valid
  end

  context 'has an email address that' do
    it 'has to be longer than 7 characters' do
        subject.mail = 'ii@c.at'
        expect(subject.mail.length).to equal(7)
        expect(subject).to_not be_valid
    end

    it 'has to be shorter than 71 characters' do
        subject.mail = "#{('a' * 66)}@a.at"
        expect(subject.mail.length).to equal(71)
        expect(subject).to_not be_valid
    end

    it 'has valid format' do
        subject.mail = 'a' * 8
        expect(subject).to_not be_valid
        subject.mail = "#{'a'*6}.at"
        expect(subject).to_not be_valid
        subject.mail = "#{'a'*6}@at"
        expect(subject).to_not be_valid
    end

    it 'is unique' do
        should validate_uniqueness_of(:mail)
    end
  end

  it 'needs a street' do
    subject.street = nil
    expect(subject).to_not be_valid
  end

  context 'has a street that' do
    it 'has to be longer than 5 characters' do
      subject.street = 'a' * 5
      expect(subject).to_not be_valid
    end

    it 'has to be shorter than 101 characters' do
      subject.street = 'a' * 101
      expect(subject).to_not be_valid
    end

    it 'is unique' do
      should validate_uniqueness_of(:street)
    end

    it 'has valid format' do
      subject.street = 'no number'
      expect(subject).to_not be_valid
      subject.street = 'street 12'
      expect(subject).to_not be_valid
    end
  end

  it 'needs a town' do
    subject.town = nil
    expect(subject).to_not be_valid
  end

  context 'has a town that' do
    it 'has a minimum name length of 3' do
      subject.town = 'a'*2
      expect(subject).to_not be_valid
    end

    it 'has a maximum name length of 100' do
      subject.town = 'a' * 101
      expect(subject).to_not be_valid
    end
  end

  it 'needs a zipcode' do
    subject.zipcode = nil
    expect(subject).to_not be_valid
  end

  context 'has a zipcode that' do
    it 'has a valid format' do
        subject.zipcode = 'A-4040'
        expect(subject).to be_valid
        subject.zipcode = 'Yes'
        expect(subject).to_not be_valid
    end
  end

  context 'has a vat that' do
    it 'is unique' do
        should validate_uniqueness_of(:VAT)
    end
  end

  it 'needs a legal name' do
    subject.legal_name = nil
    expect(subject).to_not be_valid
  end

  context 'has a legal name that' do
    it 'is unique' do
      should validate_uniqueness_of(:legal_name)
    end

    it 'has to be longer than 7 chars' do
      subject.legal_name = 'a'* 7
      expect(subject).to_not be_valid
    end

    it 'has to be shorter than 101 chars' do
      subject.legal_name = 'a' * 101
      expect(subject).to_not be_valid
    end
  end
  context 'has a homepage that' do
    it 'is unique' do
      should validate_uniqueness_of(:homepage)
    end
  end

  it 'needs a currency' do
    subject.currency = nil
    expect(subject).to_not be_valid
  end
  context 'has a currency'
end
