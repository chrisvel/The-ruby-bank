FactoryGirl.define do

  factory :user do
    id 1
    name 'John Murdock'
    email 'someone@somewhere.com'
    password '12345678'
    password_confirmation '12345678'
    created_at 2.days.ago
    updated_at 1.minute.ago
  end

  factory :eviluser do
    id 2
    name 'Don Voldemort'
    email 'evil@ismyname.com'
    password '6116116'
    password_confirmation '6116116'
    created_at 1.month.ago
    update_at 1.week.ago
  end

end
