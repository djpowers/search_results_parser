class CreateResultGroups < ActiveRecord::Migration
  def change
    create_table :result_groups do |t|
      t.integer :search_query_id, null: false

      t.timestamps
    end
  end
end
