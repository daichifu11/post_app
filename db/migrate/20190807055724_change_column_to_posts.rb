class ChangeColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :body, :text, length: 1000
  end
end
