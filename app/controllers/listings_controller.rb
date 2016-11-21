class ListingsController < ApplicationController
  def index
    @listings = Listing.search(params)
    #select * from listings where title like '%keywords%'

  end
  def new
    redirect_to new_user_session_path unless current_user
    @listing = Listing.new
  end
  def create
    @listing = Listing.new(listing_params)

      if @listing.save
         redirect_to listings_path
      else
        render :new
      end
  end
  def show
    Contact.generate(params, current_user)
  end
  def contact
    Contact.generate(params, current_user)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :created_at, :content, :picture, :price, :category_id)
    end
 end
