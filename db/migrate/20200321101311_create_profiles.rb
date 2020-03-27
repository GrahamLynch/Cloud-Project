class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :user_email
      t.string :user_clothing_preference
      t.integer :product_user_id
      t.string :product_name
      t.string :product_description
      t.timestamps
    end
  end
end
