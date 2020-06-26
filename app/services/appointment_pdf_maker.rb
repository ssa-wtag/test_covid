class AppointmentPdfMaker < Prawn::Document
  def initialize(appointment_id)
    super(top_margin: 70)
    @appointment = Appointment.find(appointment_id)
    text "Appointment Serial: #{@appointment.serial}"
    appointment_slip
  end

  def appointment_slip
    move_down 20
    table [['Name', 'Mobile', 'Address', 'Date', 'Time']] +
            [[@appointment.name, @appointment.mobile, @appointment.address, @appointment.desired_date, slot_time(@appointment.slot_id)]]
  end

  private
  def slot_time(id)
    Appointment.human_slot_time(id)
  end
end
