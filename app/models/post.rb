class Post < ApplicationRecord

  # Validations

  validates :title, :summary, :content, :published, presence: true

end
