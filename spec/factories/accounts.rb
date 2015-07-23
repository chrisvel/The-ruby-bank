FactoryGirl.define do

  factory :account do
    id 1
    name "Emergency fund"
    balance "199.99"
    created_at 2.weeks.ago
    updated_at 1.week.ago
    user_id 1
    user # associate with the user Factory :user
  end

  factory :peter_account do
    id 2
    name "Checking acc"
    balance "200.5"
    created_at 2.weeks.ago
    updated_at 1.week.ago
    user_id 2
    peter # associate with the user Factory :peter
  end

  factory :jack_account do
    id 3
    name "My Savings account"
    balance "500.96"
    created_at 2.weeks.ago
    updated_at 1.week.ago
    user_id 3
    jack # associate with the user Factory :jack
  end

end
