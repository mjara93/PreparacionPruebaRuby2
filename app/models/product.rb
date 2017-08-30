class Product < ApplicationRecord
  belongs_to :category

  scope :premium, ->{where(premium: true)}
  scope :last_n, ->(num) {limit(num)}

end
