class SendedMailer < ApplicationMailer
  def JidouSoushin(user)
     @user = user
    @greeting = "この度は当社の書籍後ご購入いただき誠にありがとうございました。到着まで今しばらくおまいください。オモドック出版局"
    mail to: @user.email,
         subject: '書籍の購入を承りました。'
  end
end
