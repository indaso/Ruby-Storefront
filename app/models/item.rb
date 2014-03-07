class Item < ActiveRecord::Base
  belongs_to :user
  validates :item_name, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: true
end
