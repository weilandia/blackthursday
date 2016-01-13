class Invoice
  attr_accessor  :id, :customer_id,  :merchant_id, :status, :created_at, :updated_at, :merchant
  def initialize(invoice_data)
    @id = invoice_data[:id]
    @customer_id = invoice_data[:customer_id]
    @merchant_id = invoice_data[:merchant_id]
    @status = invoice_data[:status]
    @created_at =  Time.new(invoice_data[:created_at])
    @updated_at = Time.new(invoice_data[:updated_at])
  end
end


# Invoice
  # id, merchan_id, customer_id
