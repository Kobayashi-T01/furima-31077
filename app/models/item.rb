class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :area
  belongs_to :day
  belongs_to :delivery_fee

  belongs_to :user
  has_one :buy
  has_one_attached :image

  validates :name, :explain, :image, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: {greater_than:300, less_than_or_equal_to: 9999999}
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }

end
