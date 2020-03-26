class AddReferenceToProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :profiles, :users, index: true
  end
end
