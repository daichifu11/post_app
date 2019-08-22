class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :body, null: false, length: 1000
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :answers, [:post_id, :user_id], unique: true
  end
end
