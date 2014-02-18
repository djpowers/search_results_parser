class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :headline, null: false
      t.string :url, null: false
      t.string :copy, null: false

      t.timestamps
    end
  end
end
