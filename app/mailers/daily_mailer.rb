class DailyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_mailer.everyday_mail.subject
  #
  def everyday_mail(user)

    mail(to: user.email, subject: "Good morning!")
  end
end
