class SystemMailer < ApplicationMailer
  default from: "rbat@feriasvivas.org.br"

  def registration_notification(user)
    @user = user
    mail(to: 'rbat_login@feriasvivas.org.br', subject: 'Novo usuário cadastrado')
  end

  def incidents_export(user, data)
    @user = user
    file_name = 'rbat_'+user.id.to_s+'_'+Time.now.strftime("%d-%m-%Y-%H-%M")+'.xlsx'
    attachments[file_name] = {
      mime_type: Mime::XLSX,
      content: data
    }

    mail(to: user.email, subject: 'Exportação de dados do RBAT')
  end
end
