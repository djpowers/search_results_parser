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
    fill_in 'Search Query', with: 'huggies diaper coupons'
    click_button 'Search'

    within '.results' do
      expect(page).to have_content('Printable diaper coupons: Huggies, Goodnites, Pampers, LUVS ...')
      expect(page).to have_content('moneysavingmom.com/.../printable-diaper-coupons-huggies-goodnites-...‎')
      expect(page).to have_content('by Crystal Paine')
      expect(page).to have_content("Diaper coupons. Need to buy diapers? Here's a list of coupons for you: $1.50 on any ONE (1) package of HUGGIES® Little Snugglers Diapers")
    end

    within '.ads' do
      expect(page).to have_content('Printable Coupons Huggies‎')
      expect(page).to have_content('coupons.webcrawler.com/‎')
      expect(page).to have_content('Search & Find Great Deals with
        Printable Coupons Huggies & Save Tons!')
    end
  end
end
