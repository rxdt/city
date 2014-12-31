class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    can :manage, :all if user.has_role? :admin

    can :read, Screen

    can [:update_account], User do |user_record|
      user_record.id == user.id
    end

    can :write, Ad 
  end
end
