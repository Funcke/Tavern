class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:show]
  before_action :authorize
  before_action :check_authorization, only: [:new, :create, :destroy]
  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit
    @products = Product.all
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)
    current_user.organization.tables << @table
    respond_to do |format|
      if @table.save
        format.html { redirect_to @table, notice: 'Table was successfully created.' }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    @orders = orders
    table = @orders[:tisch]
    @orders.delete(:tisch)
    @drinks = []
    @food = []
    @orders.each do |o|
      o[1].to_i.times do
        order = Order.new
        Table.find(table).orders << order
        Product.find_by(name: o[0].to_s).orders << order
        product = Product.find_by(name: o[0].to_s)
        if product.food
          @food << product
        else
          @drinks << product
        end
        order.save
      end
    end
    redirect_to Table.find(table), notice: 'Bestellung aufgenommen'
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url, notice: 'Table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    def set_order
      @order = Order.new
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:id)
    end

    # Or if there is no specified sum of them... permit all! ^^'
    def orders
      params.permit!
    end
end
