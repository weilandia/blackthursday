require 'csv'
require 'bigdecimal'
require_relative 'invoice'
require_relative 'data_parser'

class InvoiceRepository
  include DataParser

  attr_reader :all_invoices

  def initialize
    @all_invoices = []
  end

  def inspect
    "#<#{self.class} #{@all_invoices.size} rows>"
  end

  def create_instance(invoice_data)
    invoice = Invoice.new(invoice_data)
    @all_invoices << invoice
  end

  def all
    all_invoices
  end

  def find_by_id(invoice_id)
    search_result = all.select {|search| search.id == invoice_id}[0]
    exact_search(search_result)
  end

  def find_all_by_merchant_id(merchant_id)
    all.select {|search| search.merchant_id == merchant_id}
  end

  def exact_search(search_result)
    return nil if search_result.nil?
    search_result
  end

  def find_all_by_customer_id(customer_id)
    all.select {|search| search.customer_id == customer_id}
  end

  def find_all_by_status(status)
    all.select {|search| search.status == status}
  end
end
