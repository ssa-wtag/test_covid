require "uri"
require "net/http"
class SmsSender
  def self.call(appointment)
    new(appointment).call
  end

  def initialize(appointment)
    @appointment = appointment
  end

  def call
    mobile = @appointment.mobile
    time1 = DateTime.parse(@appointment.confirmed_date_from.to_s).strftime("%I:%M %p")
    time2 = DateTime.parse(@appointment.confirmed_date_to.to_s).strftime("%I:%M %p")
    sms = "Dear #{@appointment.first_name} #{@appointment.last_name}, please attend between #{@appointment.confirmed_date_from.to_date} #{time1} to #{@appointment.confirmed_date_to.to_date} #{time2} for your covid-19 test. Thank you."
    url = URI("http://66.45.237.70/api.php?username=01558901904&password=F3VW78YM&number=#{mobile}&message=#{sms}")
    http = Net::HTTP.new(url.host, url.port);
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/x-www-form-urlencoded"

    response = http.request(request)
    response.code == '200'
  end
end