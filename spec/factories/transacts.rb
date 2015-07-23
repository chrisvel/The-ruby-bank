FactoryGirl.define do
  factory :transact do
    amount "9.99"
    from_user_id 2
    to_user_id 3
    created_at 1.hour.ago
    updated_at 1.hour.ago
  end

end
