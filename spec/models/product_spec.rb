require 'rails_helper'

RSpec.describe Product, type: :model do
  test_category = Category.new(name: 'Drinks')
  subject {
    test_category.products.new(name: 'Coke Zero', price: 1.79, quantity: 1)
  }
  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      test_product = test_category.products.new(price: 2.99, quantity: 666)
      test_product.save
      expect(test_product.errors.full_messages.include? "Name can't be blank")
    end
    it "is not valid without a price" do
      test_product = test_category.products.new(name: 'Surge', quantity: 3)
      test_product.save
      expect(test_product.errors.full_messages.include? "Price can't be blank")
    end
    it "is not valid without a quantity" do
      test_product = test_category.products.new(name: 'OG Fanta', price: 2.99)
      test_product.save
      expect(test_product.errors.full_messages.include? "Quantity can't be blank")
    end
    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end