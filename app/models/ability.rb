class Ability
  include CanCan::Ability

  def initialize(user)

  	if user
      if user.admin?
        can :manage, :all
      else
        can :manage, User, :id => user.id
      	can :manage, Project, :owner_id => user.id
        can :manage, Resource do |res|
          res.user_id == user.id || res.project.owner_id == user.id
        end
        can :manage, Announcement, :owner_id => user.id
      end
    end

  end

end