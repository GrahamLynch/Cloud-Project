class AddPrefencesToUserschema < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :clothing_preference, :string
  end
end
