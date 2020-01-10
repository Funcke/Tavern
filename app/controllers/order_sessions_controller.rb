# frozen_string_literal: true

class OrderSessionsController < ApplicationController
  before_action :authorize
  before_action :check_authorization, only: %i[index]
  before_action :set_order_session, only: %i[show update edit destroy]

  def index
    if table.order_sessions.where(open: true).size == 1
      session = table.order_sessions.where(open: true).first
      redirect_to edit_table_order_session_path(session.table_id, session)
    else
      redirect_to new_table_order_session_path
    end
  end

  def new
    @order_session = OrderSession.new
    @food = organization.dishes
    @drinks = organization.drinks
  end

  def create
    puts params.to_json
    session = OrderSession.new(table: table, organization: organization, open: true)
    puts session
    if session.save
      redirect_to edit_table_order_session_path(session.table.id, session.id)
    else
      redirect_to :new
    end
  end

  def edit
    @order_session = set_order_session
    @food = organization.dishes
    @drinks = organization.drinks
  end

  def update
    create_orders
    redirect_to table
  end

  def destroy
    @session = set_order_session
    @session.open = false
    @session.save
  end

  private

  def permit_orders
    params.require(:order_session).permit!
  end

  def set_order_session
    OrderSession.find(params[:id])
  end

  def table
    Table.where(id: params[:table_id]).first
  end

  def create_orders
    params[:order_session].each do |product, quantity|
      quantity.to_i.times do
        order = Order.new(dish: Dish.where(name: product).first, organization: organization, order_session: set_order_session)
        unless order.save
          puts order.errors.to_json
        end
      end
    end
  end
end
