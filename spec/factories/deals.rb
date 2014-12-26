FactoryGirl.define do
  factory :screen do
    sequence(:screen_name) { |n| "screen_name#{n}" }
    blurb 'blurb'
  end
end
