FactoryGirl.define do
  factory :user do
    ignore do
      role nil
      scope nil
    end

    sequence(:email)        { |n| "email#{n}@test.com" }
    password                'password'
    password_confirmation   'password'

    before(:create) { |user| user.skip_confirmation! }

    after :create do |user, evaluator|
      user.add_role evaluator.role, evaluator.scope if evaluator.role
    end
  end
end
