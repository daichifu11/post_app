class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def change
    execute 'DELETE FROM posts;'
    add_reference :posts, :user, foreign_key: true, index: true, after: :category_id
  end
end
