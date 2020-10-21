class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @order_sending_destination = OrderSendingDestinations.new
    redirect_to root_path unless @item.order.nil?
  end

  def create
    @order_sending_destination = OrderSendingDestinations.new(order_params)
    if @order_sending_destination.valid?
      pay_item
      @order_sending_destination.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :item_id).merge(price: @item.price, user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.user_id != current_user.id
  end
end
