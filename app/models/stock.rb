class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  # class level method
  def self.stock_lookup(ticker_symbol)
    begin
      stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: stock.company_name, ticker: stock.symbol, last_price: stock.latest_price)
    rescue Exception => e
      return nil
    end
  end

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
  
end
