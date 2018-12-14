class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.admin?
      can :manage, :all
    elsif user.author?
      can :manage, Article, :user_id => user.id  
      cannot :read, User
    else
      can :read, :all
      cannot :read, User
    end
  end
end
