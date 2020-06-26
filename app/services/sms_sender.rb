require "uri"
require "net/http"
class SmsSender
  def self.call(appointment)
    new(appointment).call
  end

  def initialize(appointment)
    @appointment = Appointment.find(appointment)
  end

  def call
    mobile = @appointment.mobile
    time = @appointment.nine_ten? ? '9 AM - 10 PM' : @appointment.ten_eleven? ? '10 AM - 11 AM' : @appointment.eleven_twelve? ? '11 AM - 12 PM' : '12 PM - 1 PM'
    sms = "Dear #{@appointment.name}, please attend on #{@appointment.confirmed_date} between #{time} for your covid-19 test. Thank you."
    url = URI("http://66.45.237.70/api.php?username=01558901904&password=F3VW78YM&number=#{mobile}&message=#{sms}")
    http = Net::HTTP.new(url.host, url.port);
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/x-www-form-urlencoded"

    response = http.request(request)
    response.code == '200'
  end
end