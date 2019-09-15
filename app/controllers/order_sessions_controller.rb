class OrderSessionsController < ApplicationController
    before_action :authorize
    before_action :check_authorization, only: %i[index]
    before_action :set_order_session, only: %i[show, update, edit, destroy]
    
    def index
        if table.order_sessions.where(open: true).size == 1
            puts table.order_sessions.where(open: true).to_json
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
        OrderSession.new(table: table, organization: organization, open: true).save
    end

    def edit
        @order_session = set_order_session
        @food = organization.dishes
        @drinks = organization.drinks
    end
    
    def update

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
end
