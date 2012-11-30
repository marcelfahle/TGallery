class InfoMailer < ActionMailer::Base
  default from: "test@steelpuck.com"

  def notification_mail
    mail(to: "marcel.fahle@gedankenwerk.com", subject: "Neuer Content im FoSiS")
  end

end
