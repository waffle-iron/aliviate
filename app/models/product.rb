class Product < ApplicationRecord

  # Validations

  validates :name, :description, :price, :quantity, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: true

end
