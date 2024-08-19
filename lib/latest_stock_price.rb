# frozen_string_literal: true

require 'httparty'

class LatestStockPrice
  include HTTParty
  base_uri 'https://latest-stock-price.p.rapidapi.com/'

  def self.price(symbol)
    response = get("/price?symbol=#{symbol}", headers: headers)
    parse_response(response)
  end

  def self.prices(symbols)
    response = get("/prices?symbols=#{symbols.join(',')}", headers: headers)
    parse_response(response)
  end

  def self.price_all
    response = get('/price_all', headers: headers)
    parse_response(response)
  end

  def self.headers
    {
      'X-RapidAPI-Key' => ENV['RAPIDAPI_KEY'],
      'X-RapidAPI-Host' => 'latest-stock-price.p.rapidapi.com'
    }
  end

  def self.parse_response(response)
    JSON.parse(response.body)
  rescue JSON::ParserError
    {}
  end
end
