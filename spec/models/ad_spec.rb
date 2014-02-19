require 'spec_helper'

describe Ad do

  describe 'validations' do
    it { should validate_presence_of :headline }
    it { should validate_presence_of :url }
    it { should validate_presence_of :copy }

    it { should have_many(:ad_results).dependent(:destroy) }
    it { should have_many(:result_groups).through(:ad_results) }
  end

  describe 'database' do
    it { should have_db_column(:headline).of_type(:string).with_options(null: false) }
    it { should have_db_column(:url).of_type(:string).with_options(null: false) }
    it { should have_db_column(:copy).of_type(:string).with_options(null: false) }
  end

end
