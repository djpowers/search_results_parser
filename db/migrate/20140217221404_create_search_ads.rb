class CreateSearchAds < ActiveRecord::Migration
  def change
    create_table :search_ads do |t|
      t.integer :search_query_id, null: false
      t.integer :ad_id, null: false

      t.timestamps
    end
  end
end
