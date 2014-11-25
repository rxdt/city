FactoryGirl.define do
  factory :deal do
    sequence(:company_name) { |n| "company_name#{n}" }
    blurb 'blurb'
  end
end
