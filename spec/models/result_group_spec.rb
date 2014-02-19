require 'spec_helper'

describe ResultGroup do

  describe 'validations' do
    it { should validate_presence_of :search_query }
    it { should belong_to :search_query}

    it { should have_many(:ad_results).dependent(:destroy) }
    it { should have_many(:ads).through(:ad_results) }
  end

  describe 'database' do
    it { should have_db_column(:search_query_id).of_type(:integer).with_options(null: false) }
  end

end
