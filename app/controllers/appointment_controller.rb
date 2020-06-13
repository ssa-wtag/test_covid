class AppointmentController < ApplicationController
  def index
    if session[:user].present?
      @appointments = Appointment.all
    else
      flash[:notice] = 'Please log in to See all Appointments'
    end
  end

  def show
  end

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      flash[:notice] = "Appointment for #{appointment.first_name} on #{appointment.desired_date.to_date} created successfully"
      redirect_to new_appointment_path
    else
      render :new
    end
  end

  def update
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
                                        :desired_date)
  end
end
