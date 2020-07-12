class TestResultMaker < Prawn::Document
  attr_accessor :appointment
  GREEN_COLOR = '#057d09'.freeze
  RED_COLOR = '#f00e16'.freeze

  def initialize(appointment_id)
    super(top_margin: 70)
    @appointment = Appointment.find(appointment_id)
    # stroke_axis
    add_pdf_elements
  end

  def add_pdf_elements
    image header_image_path, :at => [20, 700], :width => 500
    move_down 100
    indent 160 do
      text "MOLECULAR BIOLOGY REPORT"
    end
    patient_info_bounding_box
    move_down 50
    indent 160 do
      text "Real Time PCR for COVID-19"
    end
    render_result
  end

  def patient_info_bounding_box
    bounding_box([20,560], :width => 500, :height => 140) do
      stroke_color '000000'
      stroke_bounds
      text_box "Name: #{appointment.name}", :style => :bold, :size => 12, :at=> [10,135], :width => 200, :height => 100
      text_box "Mobile: #{appointment.mobile}", :size => 12, :at=> [320,135], :width => 180, :height => 100
      text_box "Gender: #{appointment.gender}", :size => 12, :at=> [10,110], :width => 200, :height => 100
      text_box "Email: #{appointment.email}", :size => 12, :at=> [320,110], :width => 180, :height => 100
      text_box "Age: #{appointment.age}", :size => 12, :at=> [10,85], :width => 200, :height => 100
      text_box "Delivery Date: #{Date.today.strftime("%d/%m/%Y")}", :size => 12, :at=> [320,85], :width => 180, :height => 100
    end
  end

  def render_result
    bounding_box([20,350], :width => 500, :height => 30) do
      stroke_color '000000'
      stroke_bounds
      move_down 10
      indent 10 do
        text 'Covid-19 Test Result:'

      end
      fill_color "0000ff"
      text_box "Positive", :size => 12, :at=> [350,20], :width => 50, :height => 30
    end
  end

  private
  def slot_time(id)
    Appointment.human_slot_time(id)
  end

  def header_image_path
    Rails.root.join('app', 'assets', 'images', 'pdf_hospital.jpg').to_s
  end

  def result_color
    appointment
  end
end
