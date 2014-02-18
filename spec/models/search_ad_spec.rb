require 'spec_helper'

describe SearchAd do

  describe 'validations' do
    it { should validate_presence_of(:search_query) }
    it { should belong_to(:search_query) }

    it { should validate_presence_of(:ad) }
    it { should belong_to(:ad) }
  end

  describe 'database' do
    it { should have_db_column(:search_query_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:ad_id).of_type(:integer).with_options(null: false) }
  end

end
