require 'open-uri'

class SearchQuery < ActiveRecord::Base

  validates_presence_of :terms

  has_many :search_ads,
    dependent: :destroy
  has_many :ads,
    through: :search_ads

  def parse_ads
    search_url = 'https://www.google.com/search?q=' + terms.gsub(' ', '+')
    doc = Nokogiri::HTML(open(search_url))
    ads_results = []

    doc.css('div#rhs_block ol li').each do |ad|
      headline = ad.at_css('h3').text unless ad.at_css('h3').nil?
      url = ad.at_css('cite').text unless ad.at_css('cite').nil?
      copy = ad.at_css('.ac').text unless ad.at_css('.ac').nil?
      ads_results << [headline, url, copy] unless headline.nil?
    end
    ads_results
  end

end
