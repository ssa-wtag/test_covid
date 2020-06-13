class UserController < ApplicationController
  def index
  end

  def create
    user = User.new(appointment_params)
    if User.where(email: user.email, password: user.password).present?
      session[:user] = user.email
      redirect_to appointment_index_path
    else
      flash[:notice] = 'Email or Password is incorrect'
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

  def appointment_params
    params.require(:user).permit(:email,
                                        :password)
  end
end
