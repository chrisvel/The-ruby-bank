FactoryGirl.define do

  factory :user do
    name 'John Murdock'
    email 'someone@somewhere.com'
    password '12345678'
    password_confirmation '12345678'
  end

  factory :peter do
    name 'Peter Florrick'
    email 'pflorrick@tgw.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :jack do
    name 'Jack Bauer'
    email 'jack.b@ctu.com'
    password '12qw12qw12'
    password_confirmation '12qw12qw12'
  end

end
