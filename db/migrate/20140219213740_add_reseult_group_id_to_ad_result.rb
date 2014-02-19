class AddReseultGroupIdToAdResult < ActiveRecord::Migration
  def change
    add_column :ad_results, :result_group_id, :integer, null: false
    remove_column :ad_results, :search_query_id, :integer, null: false
  end
end
