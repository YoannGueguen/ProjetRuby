class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  def self.generate(params, user)
    Contact.create(
      user_id: user.id,
      listing_id: params[:listing_id],
      content: params[:message]
      )
    UserMailer.new_contact(params[:listing_id],user.email, params[:content])
  end
  def self.seller_contacts_for(user)
    Contact.joins('LEFT JOIN listings ON contacts.listing_id = listings.id')
            .where(['listings.user_id = ?', user.id])
            .order('contacts.created_at DESC')
  end

end
