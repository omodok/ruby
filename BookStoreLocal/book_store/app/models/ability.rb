# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, :session
    can :manage, :password
    can :manage, :registration

    if user.admin?
      can :manage, :all
    else
      can [:store, :cart], :frontend
      can [:new, :create], :backend
    end
  end
end