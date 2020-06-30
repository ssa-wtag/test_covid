require "uri"
require "net/http"
class SmsSender
  def self.call(appointment, send_result = nil)
    new(appointment, send_result).call
  end

  def initialize(appointment, send_result)
    @appointment = Appointment.find(appointment)
    @send_result = send_result
  end

  def call
    return send_result if @send_result.present?
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

  def send_result
    mobile = @appointment.mobile
    sms = "Dear #{@appointment.name}, your covid-19 test result on #{@appointment.confirmed_date} is #{@send_result}. Please see email for result report."
    url = URI("http://66.45.237.70/api.php?username=01558901904&password=F3VW78YM&number=#{mobile}&message=#{sms}")
    http = Net::HTTP.new(url.host, url.port);
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/x-www-form-urlencoded"

    response = http.request(request)
    response.code == '200'
  end
end