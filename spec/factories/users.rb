FactoryGirl.define do

<<<<<<< HEAD
  factory :user, class: User do
=======
  factory :user do
    id 1
>>>>>>> log-in
    name 'John Murdock'
    email 'someone@somewhere.com'
    password '12345678'
    password_confirmation '12345678'
    created_at 2.days.ago
    updated_at 1.minute.ago
  end

<<<<<<< HEAD
  factory :peter, class: User do
    name 'Peter Florrick'
    email 'pflorrick@tgw.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :jack, class: User do
    name 'Jack Bauer'
    email 'jack.b@ctu.com'
    password '12qw12qw12'
    password_confirmation '12qw12qw12'
=======
  factory :eviluser do
    id 2
    name 'Don Voldemort'
    email 'evil@ismyname.com'
    password '6116116'
    password_confirmation '6116116'
    created_at 1.month.ago
    update_at 1.week.ago
>>>>>>> log-in
  end

end
