class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :zipcode
      t.string :street_address
      t.text :bio
      t.string :likes
      t.string :dislikes
      t.string :profile_image_link
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
