class AddCommentscoreToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :commentscore, :string
  end
end
