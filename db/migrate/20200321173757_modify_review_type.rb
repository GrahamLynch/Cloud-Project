class ModifyReviewType < ActiveRecord::Migration[5.2]
  def change
      change_column :comments, :body, :string
  end
end
