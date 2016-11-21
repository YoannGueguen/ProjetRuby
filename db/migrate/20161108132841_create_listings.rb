class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table "users", force: :cascade do |t|
      t.timestamps
      t.string:first_name
      t.string:last_name
      t.string:email
      t.boolean:is_admin,            default:false
    end
      create_table "listings", force: :cascade do |t|
        t.timestamps
        t.string:title
        t.string:content
        t.string:picture
        t.integer:price
        t.integer:users_id
        t.integer:category_id
      end
      create_table "contacts", force: :cascade do |t|
        t.timestamps
        t.string:content
        t.integer:user_id
        t.integer:listing_id
      end
      
     create_table "categories", force: :cascade do |t|
        t.timestamps
        t.string:name
    end
  end
end
