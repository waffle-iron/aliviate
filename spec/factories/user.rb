FactoryGirl.define do
  factory :user do
    first_name "Mauricio"
    last_name "Serna"
    email "mauricio@example.com"
    password "msf9876543"
    telephone "2987477"
    cellphone "3014842209"
    address "Calle 88"
    is_admin true
  end
end
