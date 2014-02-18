class Ad < ActiveRecord::Base

  validates_presence_of :headline
  validates_presence_of :url
  validates_presence_of :copy

  has_many :search_ads,
    dependent: :destroy
  has_many :search_queries,
    through: :search_ads

end
