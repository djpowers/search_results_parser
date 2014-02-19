require 'spec_helper'

feature 'User submits a search query', %Q{
  As a User
  I want to see the results and ads for a given search
  So that I can analyze the effectiveness of different keywords
} do

  # Acceptance Criteria

  # user must enter non-blank search
  # search query is displayed
  # first ten search results are displayed
  # first eight ads are displayed
  # each result has headline, url, secondary text, and copy
  # each ad has headline, url, secondary text, and copy

  scenario 'user submits valid query' do
    visit root_path
    click_link 'New Search Query'
    fill_in 'Search Query', with: 'huggies diaper coupons'
    click_button 'Search'

    expect(page).to have_content('huggies diaper coupons')
    within '.ads' do
      expect(page).to have_content('Coupon')
      expect(page).to have_content('www.')
    end
  end

  scenario 'user submits blank query' do
    visit root_path
    click_link 'New Search Query'
    click_button 'Search'

    expect(page).to have_content("Terms can't be blank")
  end
end
