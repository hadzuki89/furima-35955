class Item < ApplicationRecord
  belongs_to :user
  #has_one :purchase_record

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day

  validates :image, :name, :description, presence: true

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :area_id
    validates :day_id
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }
end
