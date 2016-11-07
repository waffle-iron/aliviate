FactoryGirl.define do
  factory :user do
    full_name "Mauricio"
    email "mauricio@example.com"
    password "miguelysantiago"
    telephone "2987477"
    cellphone "3014842209"
    address "Calle 88"
    is_admin true
  end
end
