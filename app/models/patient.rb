class Patient < User
  attr_accessible :hour, :hour_ids, :hour_id, :specialisation_id, :specialisation_ids, :appointments, :appointments_id, :appointment_id, :doctor, :hour

  has_many :appointments
  accepts_nested_attributes_for :appointments

  has_secure_password
end