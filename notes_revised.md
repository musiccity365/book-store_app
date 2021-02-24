# Doctor
has_many :appointments
has_many :patients, through: :appointments

# Patient
has_many :appointments
has_many :doctors, through: :appointments

# Appointment
belongs_to :doctor
belongs_to :patient
foreign key patient_id, doctor_id


# User
has_many :ratings
has_many :books, through: :ratings

# Book
has_many :ratings
has_many :users, through: :ratings

# Rating
belongs_to :user
belongs_to :book