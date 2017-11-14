require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }
    
    it { should validate_uniqueness_of(:email).case_insensitive }

    it 'create new user should be valid' do 
      @user = User.new(first_name:'Mel', last_name: 'Del', email: 'mel@del.com', password: '12ab', password_confirmation: '12ab')
      expect(@user).to be_valid
    end

    it 'passwords do not match should be invalid' do
      @user = User.new(first_name:'Mel', last_name: 'Del', email: 'mel@del.com', password: '1111', password_confirmation: '12ab')
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages.size).to be > 0
    end

    it 'passwords do not exist should be invalid' do
      @user = User.new(first_name:'Mel', last_name: 'Del', email: 'mel@del.com', password: nil, password_confirmation: nil)
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages.size).to be > 0
    end

    it 'passwords with empty values should be invalid' do
      @user = User.new(first_name:'Mel', last_name: 'Del', email: 'mel@del.com', password: '', password_confirmation: '')
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages.size).to be > 0
    end

    it 'passwords smaller than 4 characters are invalid' do
      @user = User.new(first_name:'Mel', last_name: 'Del', email: 'mel@del.com', password: '123', password_confirmation: '123')
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages.size).to be > 0
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should validate user with matching login credentials' do
      @user = User.create(first_name:'Bob', last_name: 'Del', email: 'mel@del.com', password: '1234', password_confirmation: '1234')
      expect(@user.authenticate_with_credentials(@user.email, @user.password)).to eql @user
    end

    it 'should validate user with matching email in different case, login credentials' do
      @user = User.create(first_name:'Bob', last_name: 'Del', email: 'mel@del.com', password: '1234', password_confirmation: '1234')
      expect(@user.authenticate_with_credentials('mel@del.COM', @user.password)).to eql @user
    end

    it 'non-matched passwords should be invalid' do
      @user = User.create(first_name:'Bob', last_name: 'Del', email: 'mel@del.com', password: '1234', password_confirmation: '1234')
      expect(@user.authenticate_with_credentials(@user.email, "password")).to eql nil
    end

    it 'non-matched email should be invalid' do
      @user = User.create(first_name:'Bob', last_name: 'Del', email: 'mel@del.com', password: '1234', password_confirmation: '1234')
      expect(@user.authenticate_with_credentials("email", @user.password)).to eql nil
    end

    it 'should allow login with trailing whitespace in email' do
      @user = User.create(first_name:'Bob', last_name: 'Del', email: 'mel@del.com', password: '1234', password_confirmation: '1234')
      expect(@user.authenticate_with_credentials("  mel@del.com  ", @user.password)).to eql @user
    end
  end

end
