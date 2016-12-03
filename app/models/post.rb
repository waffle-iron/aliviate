class Post < ApplicationRecord

  # Validations

  validates :title, :summary, :content, presence: true

  # Tags

  acts_as_taggable

end
