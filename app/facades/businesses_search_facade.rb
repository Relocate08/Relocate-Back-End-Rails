class BusinessesSearchFacade
  def self.utilities_search(location, type)
    businesses = BusinessesSearchService.utility_search(location, type)
    open?(businesses)
  end

  def self.recreation_search(location, type)
    businesses = BusinessesSearchService.recreation_search(location, type)
    open?(businesses)
  end

  def self.homeservices_search(location, type)
    businesses = BusinessesSearchService.homeservice_search(location, type)
    open?(businesses)
  end

  def self.open?(businesses)
    results = businesses[:data].select { |result| result[:is_closed] == false }
    results.map { |result| Business.new(result) }
  end

   def self.find_business(yelp_business_id)
    business = BusinessesSearchService.find_business(yelp_business_id)
    Business.new(business)
   end
end
