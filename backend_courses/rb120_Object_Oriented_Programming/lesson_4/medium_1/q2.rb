class InvoiceEntry
  attr_reader :quantity, :product_name
  attr_writer :quantity # add `attr_writer` for `:quantity`

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Error: there is only an `attr_reader` for `:quantity` so using a setter method `#quantity=` will not work. We can fix this by either accessing the instance variable `@quantity` directly, or create an `attr_writer` for `:quantity`
