require 'rails_helper'

RSpec.feature "My Cart changes value when user clicks add to cart button", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Add to Cart button" do
    # ACT
    visit root_path
    first('.product button').click
    # DEBUG
    save_screenshot
    # VERIFY
    within('nav') {expect(page).to have_content('My Cart (1)')}
  end
end
