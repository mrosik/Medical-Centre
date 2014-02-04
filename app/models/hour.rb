class Hour < ActiveRecord::Base
  attr_accessible :appointment_date, :appointment_time, :doctor_id, :appointment_id, :id
  belongs_to :appointment
  belongs_to :doctor
  accepts_nested_attributes_for :appointment
  end