class Product < ApplicationRecord
  belongs_to :category

  scope :premium, ->{where(premium: true)}
  scope :last_n, ->(num) {limit(num)}

  after_destroy :last_product

  def last_product
    Category.all.each do |category|
      if category.products.empty?
        category.destroy
      end
    end
  end

  def precio_final
    disc = self.category.discount
    pric = self.price

    descuento = (pric * disc.to_f)/100
    return pric - descuento
  end
end
