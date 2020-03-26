class AddAttributesToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :name, :string
    add_column :profiles, :gender, :string
    add_column :profiles, :age, :string
    add_column :profiles, :location, :string
  end
end
