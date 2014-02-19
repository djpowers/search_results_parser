class ChangeSearchAds < ActiveRecord::Migration
  def change
    rename_table :search_ads, :ad_results
  end
end
