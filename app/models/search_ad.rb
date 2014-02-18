class SearchAd < ActiveRecord::Base

  validates_presence_of :search_query
  validates_presence_of :ad

  belongs_to :search_query
  belongs_to :ad

end
