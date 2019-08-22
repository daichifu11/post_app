class ChangeColumnToBestAnswer < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :best_answers, :answer_id, :integer, null: true
      change_column :best_answers, :post_id, :integer, null: true
      change_column :best_answers, :user_id, :integer, null: true
    end

    def down
      change_column :best_answers, :answer_id, :integer, null: false
      change_column :best_answers, :post_id, :integer, null: false
      change_column :best_answers, :user_id, :integer, null: false
    end
  end
end
