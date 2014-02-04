class ApplicationController < ActionController::Base
  protect_from_forgery
 # before_filter :authenticate_user!,  :except  => [:home, :about]

  #added 10.04.2013
  def has_role?(current_user, role)
    return !!current_user.roles.find_by_name(role.to_s.camelize)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user

  protected
  def authorize
    unless current_user
      redirect_to login_url, :notice => "Please log in"
    end
  end

  def is_admin?
    unless current_user.admin
      redirect_to login_url, :alert => "You are not authorized to access the requested page"
    end
  end

  def is_doctor?
    unless current_user.type == "Doctor"
      redirect_to login_url, :alert => "You are not authorized to access the requested page"
    end
  end

=begin
 "#{ def update_the_hours_table
    }"hour_modification = Hour.find(appointment_id)
    hour_modification.id = self.id
    hour_modification.save
  #end
=end
end
