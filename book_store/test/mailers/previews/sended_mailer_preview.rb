# Preview all emails at http://localhost:3000/rails/mailers/sended_mailer
class SendedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sended_mailer/JidouSoushin
  def JidouSoushin
    SendedMailer.JidouSoushin
  end

end
