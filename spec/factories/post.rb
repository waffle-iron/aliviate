FactoryGirl.define do
  factory :post do
    id 1
    title "New title"
    summary "New Summary"
    content "New content"
    published true
    tag_list "wellness"
  end
end
