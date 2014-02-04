class Role < ActiveRecord::Base
  has_many :users, :through => :roles_users
  has_many :roles_users
  #Roles = %w[admin, doctor, patient]
  attr_accessible :id, :name
end