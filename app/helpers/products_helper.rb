# frozen_string_literal: true

# Helper module for products
module ProductsHelper
  def ingridients
    Ingridient.all
  end
end
