class Product < ApplicationRecord

  # Validations

  validates :name, :description, :price, :quantity, presence: true

end
