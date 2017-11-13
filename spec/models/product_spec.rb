require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:category) }

    it 'should be valid' do 
      @category = Category.new
      @product = Product.new(name:'Mel', price_cents: 20, quantity: 44, category: @category)
      expect(@product).to be_valid
    end

    it 'will not be valid without a name' do
      @category = Category.new
      @product = Product.new(name: nil, price_cents: 20, quantity: 44, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages.size).to be > 0
    end

    it 'will not be valid without a price' do 
      @category = Category.new
      @product = Product.new(name:'Mel', price_cents: nil, quantity: 44, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages.size).to be > 0     
    end 

    it 'will not be valid without a quantity' do
      @category = Category.new
      @product = Product.new(name:'Mel', price_cents: 20, quantity: nil, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages.size).to be > 0      
    end 

    it 'will not be valid without category' do
      @category = Category.new
      @product = Product.new(name:'Mel', price_cents: 20, quantity: 44, category: nil)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages.size).to be > 0
    end
  end
end
