class SystemMailer < ApplicationMailer
  default from: "rbat@feriasvivas.org.br"

  def registration_notification(user)
    @user = user
    mail(to: 'rbat_login@feriasvivas.org.br', subject: 'Novo usuário cadastrado')
  end
end
