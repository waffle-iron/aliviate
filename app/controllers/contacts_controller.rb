class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    if @contact.deliver
      flash[:sucess] = t('success_email_message')
      redirect_to :root
    else
      flash.now[:error] = t('error_email_message')
      render :new
    end
  end

end

