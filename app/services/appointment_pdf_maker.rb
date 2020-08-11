class AppointmentPdfMaker < Prawn::Document
  def initialize(appointment_id)
    super(top_margin: 70)
    @appointment = Appointment.find(appointment_id)
    image header_image_path, :at => [20, 700], :width => 500
    move_down 100
    text "Appointment Serial: #{@appointment.serial}"
    appointment_slip
  end

  def appointment_slip
    move_down 20
    table [['Name', 'Mobile', 'Address', 'Desired Date', 'Time']] +
            [[@appointment.name, @appointment.mobile, @appointment.address, @appointment.desired_date, slot_time(@appointment.slot_id)]]
  end

  private
  def slot_time(id)
    Appointment.human_slot_time(id)
  end

  def header_image_path
    Rails.root.join('app', 'assets', 'images', 'pdf_hospital.jpg').to_s
  end
end
