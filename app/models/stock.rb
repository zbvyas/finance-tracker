class Stock < ApplicationRecord
  # class level method
  def self.stock_lookup(ticker_symbol)
    begin
      stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: stock.company_name, ticker: stock.symbol, last_price: stock.latest_price)
    rescue Exception => e
      return nil
    end
  end
end
