FactoryGirl.define do

  factory :transact do
    association :from_user, factory: :peter
    association :to_user, factory: :jack
    amount "19.99"
    # from_user_id 2
    # to_user_id 3
    created_at 1.hour.ago
    updated_at 1.hour.ago
  end

end
