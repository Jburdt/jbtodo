class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_quote

  def after_sign_in_path_for(resource)
    return_path = stored_location_for(resource)
    return_path == root_path ? todos_path : return_path
  end

  def get_quote
    cached = Kredis.json Date.today.to_s
    puts cached.value
    if !cached.value.nil?
      j = JSON.parse(cached.value)
      puts "Cached quote"
      @quote = QuotesApi::Quote.new(j["quote"], j["author"])
      return
    end

    @quote = QuotesApi.new.get
    j = Kredis.json Date.today.to_s
    j.value = @quote.to_json
    return @quote
  end
end
