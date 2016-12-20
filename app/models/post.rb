class Post < ApplicationRecord

  # Validations

  validates :title, :summary, :content, presence: true

  # Tags

  acts_as_taggable

  # Methods

  def tags_separated_by_commas
    tag_list.join(', ')
  end

end
