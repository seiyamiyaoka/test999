class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def permit
    @contact = Contact.new(params_create)
  end
  def thanks
    @contact = Contact.create
  end
  
  private
  
  def params_create
    require.params(:contact).permit(:name,:email,:content)
  end
end
