class Item < ApplicationRecord
  belongs_to :item
  has_one :buy
  belongs_to_active_hash :category_id
  belongs_to_active_hash :status_id
  belongs_to_active_hash :delivery_fee_id
  belongs_to_active_hash :area_id
  belongs_to_active_hash :day_id

  validates :title, presence: true
end
