require 'httparty'

class QuotesApi
  include HTTParty

  base_uri "https://api.api-ninjas.com/v1"

  def initialize(api_key: Rails.application.credentials.dig(:api_ninjas, :api_key), category: "computers")
    @options = {headers: {"X-Api-Key": api_key}, query: {category: category}}
  end

  def get
    response = self.class.get("/quotes", @options)
    if response.success?
      q = response[0]
      Quote.new(q["quote"], q["author"] )
    else
      puts "Call to API Ninjas Quotes API failed, status code #{resonse.code}"
    end
  end

  Quote = Struct.new(:quote, :author)
end
