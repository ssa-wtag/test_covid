class Appointment < ApplicationRecord
  enum slot_id: { nine_ten: 0, ten_eleven: 1, eleven_twelve: 2, twelve_one: 3 }

  def self.nine_ten_available?(date)
    Appointment.where(desired_date: date).nine_ten.count < 3
  end

  def self.ten_eleven_available?(date)
    Appointment.where(desired_date: date).ten_eleven.count < 3
  end

  def self.eleven_twelve_available?(date)
    Appointment.where(desired_date: date).eleven_twelve.count < 3
  end

  def self.twelve_one_available?(date)
    Appointment.where(desired_date: date).twelve_one.count < 3
  end

  def self.human_slot_time(id)
    case id
    when 'nine_ten'
      '9 AM - 10 AM'
    when 'ten_eleven'
      '10 AM - 11 AM'
    when 'eleven_twelve'
      '11 AM - 12 PM'
    when 'twelve_one'
      '12 PM - 1 PM'
    else
      'anytime'
    end
  end
end
