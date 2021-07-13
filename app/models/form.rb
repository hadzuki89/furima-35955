class Form
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building, :number, :user_id, :item_id, :token

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :number, presence: true, format: { with: /\A\d{10,11}\z/ }

  validates :city, :house_number, :user_id, :item_id, :token, presence: true
  validates :area_id, numericality: { other_than: 1 }

  # belongs_to :user
  # belongs_to :item

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Destination.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building: building,
                       number: number, order_id: order.id)
  end
end
