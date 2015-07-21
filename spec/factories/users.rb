FactoryGirl.define do
  factory :user do
    name 'John Murdock'
    email 'someone@somewhere.com'
    password '12345678'
    password_confirmation '12345678'
  end
end
