require 'spec_helper'

describe AdResult do

  describe 'validations' do
    it { should validate_presence_of(:result_group) }
    it { should belong_to(:result_group) }

    it { should validate_presence_of(:ad) }
    it { should belong_to(:ad) }
  end

  describe 'database' do
    it { should have_db_column(:result_group_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:ad_id).of_type(:integer).with_options(null: false) }
  end

end
