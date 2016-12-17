class Product < ApplicationRecord

  # Validations

  validates :name, :description, :price, :quantity, presence: true
  validates :price, :quantity, numericality: true

end
