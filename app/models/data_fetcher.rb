class DataFetcher
  def initialize
    @nytimes_connection = Faraday.new(:url => 'http://api.nytimes.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def get_articles(term)
    response = @nytimes_connection.get do |req|
    req.url "http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{term}&api-key=1b555be9ea71ba6c7d6acb54548e4197:14:56248529"
    req.headers['Content-Type'] = 'application/json'
  end
    JSON.parse(response.body)
  end

end
