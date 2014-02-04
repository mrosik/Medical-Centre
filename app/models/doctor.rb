class Doctor < User
  attr_accessible :hour, :hour_ids, :hour_id, :specialisation_id, :specialisation_ids
  has_many :hours
  accepts_nested_attributes_for :hours

  has_secure_password
end