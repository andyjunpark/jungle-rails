require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    context "with name, price, quantity, and category" do
      it "is valid with all four fields set complete" do
        @category = Category.create(
          name: "instruments"
        )
        @product = Product.create(
          name: "Acoustic Guitar",
          price: 200,
          quantity: 10,
          category: @category
        )
        expect(@product.errors.full_messages).to be_empty
      end
    end

    it "is valid with valid name" do
      @category = Category.create(
        name: "instruments"
      )
      @product = Product.create(
        price: 200,
        quantity: 10,
        category: @category
      )
      expect(@product.errors.full_messages).to include(/Name can't be blank/)
    end

    it "is valid with valid price" do
      @category = Category.create(
        name: "instruments"
      )
      @product = Product.create({
        name: 'Acoustic Guitar',
        quantity:10,
        category: @category
      })
      expect(@product.errors.full_messages).to include(/Price can't be blank/)
    end

    it "is valid with valid quantity" do
      @category = Category.create(
        name: "instruments"
      )
      @product = Product.create({
        name: 'Acoustic Guitar',
        price: 200,
        category: @category
      })
      expect(@product.errors.full_messages).to include(/Quantity can't be blank/)
    end

    it "is valid with valid category" do
      @category = Category.create(
        name: "instruments"
      )
      @product = Product.create({
        name: 'Acoustic Guitar',
        price: 200,
        quantity: 10
      })
      expect(@product.errors.full_messages).to include(/Category can't be blank/)
    end

  end
end