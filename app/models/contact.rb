class Contact < MailForm::Base

  attribute :name, validate: true
  attribute :message,   validate: true
  attribute :email,     validate: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  attribute :nickname,  captcha: true


  def headers
    {
      subject: "Alguien en consultorioaliviate.com te ha enviado un mensaje",
      to: "mauricioserf@gmail.com",
      from: %("#{name}" <#{email}>)
    }
  end

end

