require 'spec_helper'

describe SearchQuery do

  describe 'validations' do
    it { should validate_presence_of :terms }

    it { should have_many(:search_ads).dependent(:destroy) }
    it { should have_many(:ads).through(:search_ads) }
  end

  describe 'database' do
    it { should have_db_column(:terms).of_type(:string).with_options(null: false) }
  end

  let(:search) { FactoryGirl.create(:search_query) }

  it 'parses the ads from a search' do
    expect(search.parse_ads.length).to be > 4
    expect(search.parse_ads).to_not include([nil, nil, nil])
  end

end
