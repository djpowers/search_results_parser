class Ad < ActiveRecord::Base

  validates_presence_of :headline
  validates_presence_of :url
  validates_presence_of :copy

  has_many :ad_results,
    dependent: :destroy
  has_many :result_groups,
    through: :ad_results

end
