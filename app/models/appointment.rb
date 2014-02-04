class Appointment < ActiveRecord::Base
  attr_accessible  :user_id, :users_ids, :doctors_id, :hour_id, :doctor_id, :patient, :patient_id, :id

  belongs_to :patient
  has_one :hour
end
