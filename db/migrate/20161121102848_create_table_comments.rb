class CreateTableComments < ActiveRecord::Migration[5.0]
  def change
    create_table "comments", force: :cascade do |t|
      t.timestamps
      t.string:content
      t.integer:user_id
      t.integer:listing_id
    end
  end
end
