class OrderSendingDestinations
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :token, :price, :order_id, :user_id


  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :house_number
    validates :building_name
    validates :order_id
    validates :city
    validates :token
    validates :price
  end

  def save
    
    order = Order.create(item_id: item_id, user_id: user_id)

    SendingDestination.create(
      post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, 
      building_name: building_name, phone_number: phone_number, order_id: order.id
    )

  end

end

