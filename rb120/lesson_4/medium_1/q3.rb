class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# If we change `attr_reader` to `attr_writer`, then it means that `@product_name` could also be altered in future code. This could be an unintended consequence

# It also makes the `#update_quantity` method redundant since the instance variable `@quantity` is directly accessible and able to be changed.
