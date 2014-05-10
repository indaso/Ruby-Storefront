class Item < ActiveRecord::Base
  belongs_to :user
  validates :item_name, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: true

  def self.search(search)
  	if search
  		where('item_name LIKE ?', "%#{search}%")
  	else
  		scoped
  	end
  end
end
