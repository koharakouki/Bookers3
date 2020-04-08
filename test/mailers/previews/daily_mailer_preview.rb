# Preview all emails at http://localhost:3000/rails/mailers/daily_mailer
class DailyMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/daily_mailer/everyday_mail
  def everyday_mail(users)
    DailyMailer.everyday_mail(users)
  end

end
