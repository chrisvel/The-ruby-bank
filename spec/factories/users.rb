FactoryGirl.define do
  factory :user do
    name 'John Murdock'
    email 'someone@somewhere.com'
    password_digest '12345678'
  end
end
