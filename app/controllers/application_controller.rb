class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :quote

  def after_sign_in_path_for(resource)
    return_path = stored_location_for(resource)
    return_path == root_path ? todos_path : return_path
  end

  def quote
    cached = Kredis.json Date.today.to_s
    unless cached.value.nil?
      j = JSON.parse(cached.value)
      @quote = QuotesApi::Quote.new(j['quote'], j['author'])
      return
    end

    load_quote
  end

  private

  def load_quote
    @quote = QuotesApi.new.get
    j = Kredis.json Date.today.to_s
    j.value = @quote.to_json
  end
end
