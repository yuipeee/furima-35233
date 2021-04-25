class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :status_id
  belongs_to :shipping_cost_id
  belongs_to :shipping_area_id
  belongs_to :shipping_day_id

  with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 9999999 }
  validates :category_id
  validates :status_id
  validates :shipping_cost_id
  validates :shipping_area_id
  validates :shipping_day_id
  end

  with_options numericality: { other_than: 1 }  do
  validates :category_id
  validates :status_id
  validates :shipping_cost_id
  validates :shipping_area_id
  end

end