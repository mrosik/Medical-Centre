class Specialisation < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :users, :doctor_id
 has_and_belongs_to_many :users
  #accepts_nested_attributes_for :users
end
