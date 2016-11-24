class Post < ApplicationRecord

  # Validations

  validates :title, :summary, :content, presence: true

end
