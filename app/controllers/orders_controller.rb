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

      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: form_params[:token], 
        currency: 'jpy' 
      )
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def form_params
    params.require(:form).permit( :postal_code, :area_id, :city, :house_number, :building, :number, :order, :user_id, :item_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

end