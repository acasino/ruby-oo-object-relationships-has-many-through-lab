# The Patient class needs a class variable @@all that begins as an empty array.
# The Patient class needs a class method .all that lists each patient in the class variable.
# A patient is instantiated with a name and be saved in the @@all array.
# The Patient class needs an instance method, #new_appointment, that takes in a date and an instance of the Doctor class in this order and creates a new Appointment. The Appointment should know that it belongs to the patient.
# The Patient class needs an instance method, #appointments, that iterates through the Appointments array and returns Appointments that belong to the patient.
# The Patient class needs an instance method, #doctors, that iterates over that patient's Appointments and collects the doctor that belongs to each Appointment.
class Patient
    attr_accessor :name, :date
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.patient == self
        end
    end

    def doctors
        appointments.map(&:doctor)
    end

end

