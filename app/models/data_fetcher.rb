class DataFetcher
  def initialize
    @nytimes_connection = Faraday.new(:url => 'http://api.nytimes.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def article
    response = @nytimes_connection.get do |req|
    req.url "/svc/search/v2/articlesearch.json", {'api-key': '1b555be9ea71ba6c7d6acb54548e4197:14:56248529'}
    req.headers['Content-Type'] = 'application/json'
  end
    JSON.parse(response.body)
  end

  def find_article
    response = @nytimes_connection.get do |req|
    req.url "/svc/search/v2/articlesearch.json", {'api-key': '1b555be9ea71ba6c7d6acb54548e4197:14:56248529'}
    req.headers['Content-Type'] = 'application/json'
    query = "Obama"
  end
    JSON.parse(response.body)
  end
end
