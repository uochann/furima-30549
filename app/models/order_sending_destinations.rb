class OrderSendingDestinations
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :token, :price, :order_id, :user_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :house_number
    validates :building_name
    validates :city
    validates :token
    validates :price
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    SendingDestination.create(
      post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
      building_name: building_name, phone_number: phone_number, order_id: order.id
    )
  end
end
