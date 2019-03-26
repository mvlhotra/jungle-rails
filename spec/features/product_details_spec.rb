require 'rails_helper'

RSpec.feature "Visitor is navigated to product details", type: :feature, js: true do
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

  scenario "They click product detail button" do
    # ACT
    visit root_path
    click_on @category.products.first.name
    # render stuff on the page


    # DEBUG
    save_screenshot
    # VERIFY
    find('.products-show').visible?
  end
end
