class CreateSearchQueries < ActiveRecord::Migration
  def change
    create_table :search_queries do |t|
      t.string :terms, null: false

      t.timestamps
    end
  end
end
