class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  validates :pps_no,
            presence: true
  validates :first_name,
            :length =>{:minimum => 2, :maximum => 50}
  validates :last_name,
            :length =>{:minimum => 2, :maximum => 50}
  validates :gender,
            presence: true
  validates :dob,
            presence: true


  validates :email, presence: true, uniqueness: true
  validates :password,
            :length => {:minimum => 8, :maximum => 16, :on => :create}
  validates :email,
            :length => {:minimum => 5, :maximum => 50},
            :format => {:with =>
                            /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}
  before_create { generate_token(:auth_token) }
  #before_create :setup_role

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :dob, :first_name, :last_name, :gender, :pps_no, :specialisation, :specialisation_id, :specialisation_name, :roles, :roles_id, :roles_name, :appointments, :appointments_id, :patient, :doctor_id, :specialisation_ids
  # attr_accessible :title, :body

  #has_many :appointments, :through => :users_appointments
  #has_many :users_appointments
  #belongs_to :appointment


  has_and_belongs_to_many :specialisations

  has_many :roles, :through => :roles_users
  has_many :roles_users
  has_secure_password
  GENDERS = [ "Female", "Male" ]
#Roles = %w[admin, doctor, patient]
  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
