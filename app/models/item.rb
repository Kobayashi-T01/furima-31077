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
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: {greater_than_or_equal_to:300, less_than_or_equal_to: 9999999}
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :area_id
    validates :day_id
  end
end
