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
    appointment = Appointment.new(appointment_params)
    if appointment.save
      flash[:notice] = "Appointment for #{appointment.first_name} on #{appointment.desired_date_from.to_date} created successfully"
      redirect_to new_appointment_path
    else
      render :new
    end
  end

  def update
    appointment = Appointment.find(params[:id])
    appointment.confirmed_date_from = appointment_params[:confirmed_date_from].to_datetime
    appointment.confirmed_date_to = appointment_params[:confirmed_date_to].to_datetime
    appointment.sent_sms = true
    if SmsSender.call(appointment)
      appointment.save
      flash[:notice] = "Message Sent for #{appointment.first_name} on #{appointment.confirmed_date_from}"
    end

    redirect_to appointment_index_path
  end

  def new
    @appointment = Appointment.new
  end

  def destroy
  end

  private

  def appointment_params
    params.require(:appointment).permit(:first_name,
                                        :last_name,
                                        :mobile,
                                        :desired_date_from,
                                        :desired_date_to,
                                        :confirmed_date_from,
                                        :confirmed_date_to)
  end
end
