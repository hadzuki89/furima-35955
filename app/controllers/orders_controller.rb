class OrdersController < ApplicationController
  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
  end

  def new
    @destination = Destination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(form_params)
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def form_params
    params.permit( :poatal_code, :area_id, :city, :house_number, :building, :number, :order, :user_id, :item_id)
  end

end
