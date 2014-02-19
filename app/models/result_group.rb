class ResultGroup < ActiveRecord::Base

  validates_presence_of :search_query
  belongs_to :search_query

  has_many :ad_results,
    dependent: :destroy
  has_many :ads,
    through: :ad_results

end
