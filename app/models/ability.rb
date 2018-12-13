class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.admin?
      can :manage, :all
    elsif user.author?
      can [:read, :create], Article
      can [:update, :destroy], Article, :user_id => user.id  
    else
      can :read, :all
    end
  end
end
