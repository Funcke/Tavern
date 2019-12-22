# frozen_string_literal: true

class ProductsController < ApplicationController
  include ProductsHelper
  before_action :check_authorization
  before_action :authorize
  before_action :set_product, only: %i[show edit update delete]
  before_action :set_ingredients, only: %i[new show edit]

  def show; end

  def create
    product = Product.new(permit_product)
    params[:product][:ingridients].each do |name, value|
      product.ingridients << Ingridient.where(name: name).first if value == 1
    end
    organization.products << product
    if product.save
      redirect_to product, notice: 'Product has been created successfully!'
    else
      redirect_to new_product_url, notice: 'Product is not valid!'
    end
  end

  def new
    @product = Product.new
  end

  def edit; end

  def update
    if @product.update(permit_params)
      redirect_to @product, notice: 'Product updated successfully'
    else
      redirect_to edit_product_url(@product), notice: 'Product could not be updated'
    end
  end

  def destroy
    if @product.destroy
      redirect_to organization, notice: 'Product successfully destroyed!'
    else
      redirect_to request.env['HTTP_REFERER'], notice: 'Product could not be destroyed!'
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_ingredients
    @ingredients = ingridients
  end

  def permit_product
    params.require(:product).permit(:name, :price)
  end
end
