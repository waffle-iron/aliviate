class Post < ApplicationRecord

  # Validations

  validates :title, :summary, :content, presence: true

  # Tags

  acts_as_taggable
  # acts_as_taggable_on :tags

end
