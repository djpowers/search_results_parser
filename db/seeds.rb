# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@search_query = SearchQuery.find_or_initialize_by(terms: 'huggies diaper coupons')
@result_group = ResultGroup.create(search_query: @search_query)
@search_query.parse_ads.each do |ad|
  returned_ad = Ad.find_or_create_by(headline: ad[0], url: ad[1], copy: ad[2])
  @ad_result = AdResult.new(result_group: @result_group, ad: returned_ad)
  @ad_result.save
end
