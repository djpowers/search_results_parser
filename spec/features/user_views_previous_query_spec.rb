require 'spec_helper'

feature 'User views previous search query', %Q{
  As a User
  I want to view historical search results
  So that I can analyze trends over time
} do

  scenario 'user views previous query' do
    visit root_path
    click_link 'New Search Query'
    fill_in 'Search Query', with: 'huggies diaper coupons'
    click_button 'Search'

    visit root_path
    click_link 'View Previous Search Results'
    expect(page).to have_content('1')

    click_link 'huggies diaper coupons'
    expect(page).to have_content('Coupon')
    expect(page).to have_content('www.')
  end

end
