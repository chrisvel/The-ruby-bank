FactoryGirl.define do

  factory :account, class: Account do
    #association :user, factory: :user
    id 1
    name "Emergency fund"
    balance "199.99"
    created_at 2.weeks.ago
    updated_at 1.week.ago
  end

  factory :peter_account, class: Account do
    #association :user, factory: :peter
    id 2
    name "Checking acc"
    balance "200.5"
    created_at 2.weeks.ago
    updated_at 1.week.ago
  end

  factory :jack_account, class: Account do
    #association :user, factory: :jack
    id 3
    name "My Savings account"
    balance "500.96"
    created_at 2.weeks.ago
    updated_at 1.week.ago
  end

end
