class Account::MessagesController < Account::AccountController

  def index
    @contacts = Contact.seller_contacts_for(current_user)
  end
end
