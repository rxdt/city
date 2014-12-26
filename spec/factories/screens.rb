FactoryGirl.define do
  factory :screen do
    sequence(:screen_name) { |n| "screen_name#{n}" }
    description 'blurb'
  end
end
