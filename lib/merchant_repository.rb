require "csv"
require_relative '../lib/merchant'

class MerchantRepository

  attr_reader :all_merchants
  def initialize(merchant_data, item_repo)
    @all_merchants = []
    @items = item_repo
    load_data(merchant_data)
  end

  def load_data(data)
    merchants = CSV.open data, headers: true, header_converters: :symbol

    merchants.each do |row|
      merchant_data= {:id =>  row[:id].to_i,
                      :name => row[:name],
                      :created_at => row[:created_at],
                      :updated_at => row[:updated_at]
                    }
      @all_merchants << Merchant.new(merchant_data, @items)
    end
  end

  def inspect
    "#<#{self.class} #{@all_merchants.size} rows>"
  end

  def all
    @all_merchants
  end

  def find_by_id(merchant_id)
    search_result = @all_merchants.select {|search| search.id == merchant_id}
    exact_merchant_search(search_result)
  end

  def find_by_name(merchant_name)
    search_result = @all_merchants.select {|search| search.name.downcase == merchant_name.downcase}
    exact_merchant_search(search_result)
  end

  def exact_merchant_search(search_result)
    if search_result.empty? == true
      search_result = nil
    else
      search_result = search_result[0]
    end
    search_result
  end

  def find_all_by_name(search_fragment)
    @all_merchants.select {|search| search.name.downcase.include? search_fragment.downcase}
  end
end
