require 'rails_helper'

RSpec.feature "AddToCart", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "cart qty count will add 1" do

      visit root_path
      first('button.btn-primary').click

      sleep 1
      save_screenshot 'add_to_cart.png'

      expect(page).to have_text 'My Cart (1)'
    end


end
