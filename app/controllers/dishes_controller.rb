# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :authorize
  before_action :check_authorization
  before_action :set_dish, only: %i[edit update delete show]

  def new
    @dish = Dish.new
  end

  def create
    @dish = organization.dishes.create(permit_params)
    @dish.ingridients << collect_ingridients
    if @dish.save
      redirect_to @dish, message: 'Success'
    else
      puts @dish.errors.to_json
      redirect_to new_dish_path, message: @dish.errors
    end
  end

  def edit; end

  def update
    @dish.update(permit_params)
    @dish.ingridients = collect_ingridients
    if @dish.save
      redirect_to @dish, message: 'success'
    else
      redirect_to edit_dish_path(@dish), message: @dish.errors
    end
  end

  def destroy
    @dish.destroy
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def permit_params
    params.require(:dish).permit(:name, :description, :price, :category_id)
  end

  def collect_ingridients
    params[:dish][:ingridients].collect  do |id|
      organization.ingridients.find(id)
    end
  end
end
