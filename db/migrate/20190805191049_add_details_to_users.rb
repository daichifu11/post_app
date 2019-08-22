class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string, null: false
    add_column :users, :age, :integer, null:false
    add_column :users, :occupation, :string, null: false
  end
end
