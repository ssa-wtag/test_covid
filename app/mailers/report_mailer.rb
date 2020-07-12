class ReportMailer < ActionMailer::Base

  def send_mail(appointment)
    attachments['report.pdf'] = File.read Rails.root.join('tmp', "test.pdf")
    mail(
      :subject => 'Covid-19 Test Report',
      :to  => "#{appointment.email}",
      :from => 'noreply@gmail.com',
      :body => 'Please find your attached report here.')
  end
end
