class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 9999999 },format: { with:/\A[0-9]+\Z/ }
  validates :category_id
  validates :status_id
  validates :shipping_cost_id
  validates :shipping_area_id
  validates :shipping_day_id
  end

  with_options numericality: { other_than: 0 }  do
  validates :category_id
  validates :status_id
  validates :shipping_cost_id
  validates :shipping_area_id
  validates :shipping_day_id
  end

end