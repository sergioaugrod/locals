FactoryGirl.define do
  factory :group do
    name 'Test Group'
    latitude '-50.00'
    longitude '-45.03'
    active true

    association :creator, factory: :user
  end
end
