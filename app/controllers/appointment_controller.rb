class AppointmentController < ApplicationController
  def index
    if session[:user].present?
      @appointments = Appointment.where(sent_sms: false)
    else
      flash[:notice] = 'Please log in to See all Appointments'
    end
  end

  def show
  end

  def create
    serial = ('1' + DateTime.now.strftime("%m%d%H%M%S")).split('').shuffle.join
    attributes = appointment_params.to_h.merge!(serial: serial)
    @appointment = Appointment.new(attributes)
    if @appointment.save
      redirect_to generate_pdf_path(appointment: @appointment)
    else
      render :new
    end
  end

  def generate_pdf
    @appointment = Appointment.find(params[:appointment])
  end

  def download_pdf
    appointment = Appointment.find(params[:appointment])
    respond_to do |format|
      format.pdf do
        pdf = AppointmentPdfMaker.new(appointment.id)
        send_data pdf.render, file_name: "#{appointment.name}'s Appointment Slip.pdf",
                              type: 'application/pdf'
      end
    end
  end

  def update
    appointment = Appointment.find(params[:id])
    appointment.confirmed_date = appointment_params[:confirmed_date].to_date
    appointment.sent_sms = true
    appointment.save
    if SmsSender.call(params[:id])
      appointment.save
      flash[:notice] = "Message Sent for #{appointment.name} on #{appointment.confirmed_date}"
    end

    redirect_to appointment_index_path
  end

  def new
    @date = params['desired_appointment_date']
    slot_status = @date.present? ? appointment_slot_status(@date) : {}
    @appointment = Appointment.new
    respond_to do |format|
      format.html
      format.json { render json: { date: @date, slot_status: slot_status }.to_json }
    end
  end

  def destroy
  end

  def upload_result
    @appointments = Appointment.where(sent_sms: true)
  end

  def save_result_file
    flash[:notice] = 'Test Result Successfully Uploaded'
    redirect_to upload_result_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:name,
                                        :email,
                                        :mobile,
                                        :address,
                                        :desired_date,
                                        :slot_id,
                                        :confirmed_date,
                                        :confirmed_date,
                                        :result)
  end

  def appointment_slot_status(date)
    {
      nine_ten: Appointment.nine_ten_available?(date),
      ten_eleven: Appointment.ten_eleven_available?(date),
      eleven_twelve: Appointment.eleven_twelve_available?(date),
      twelve_one: Appointment.twelve_one_available?(date),
    }
  end
end
