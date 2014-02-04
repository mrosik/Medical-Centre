
class Ability
  include CanCan::Ability
end

def initialize(user)
  user ||= User.new # guest user
  can :manage, :all
  if user.role? :Admin
    can :manage, :all
   # can :create, :Appointment
    can :create, :Specialisation
    can :create, :User
  elsif user.role? :Doctor
    can :read, [Appointment, Specialisation]
    can [:edit, :update], Appointment
  elsif user.role? :Patient
    can :manage, :Appointment;  Appointment.try(:user) == user
    can :edit, :User; User.try(:user) == user

  end
  end

