class Product < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :price,         numericality: { greater_than_or_equal_to: 300, less_than: 9999999 },
                            format: { /\A[0-9]+\z/ }
  validates :user
  end

  with_options numericality: { other_than: 1 }  do
  validates :category_id
  validates :status_id
  validates :shipping_cost_id
  validates :shipping_area_id
  end

end