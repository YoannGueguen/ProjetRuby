class Listing < ApplicationRecord
  belongs_to :category
  has_many :contacts
  has_many :comments
  belongs_to :user
  mount_uploader :picture, ImageUploader
  def self.search(params)
    if params[:category_id]
      @listings=Listing.where(["category_id=?",params[:category_id]])
    else
      @listings=Listing.where("title ILIKE :query OR content ILIKE :query", query: "%#{params[:keyword]}%")
    end
  end
end
