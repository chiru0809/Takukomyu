class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :title_id, :integer
    add_column :users, :main_playstyle, :integer
    add_column :users, :message, :text
    add_column :users, :twitter_user_name, :string
    add_column :users, :is_private, :boolean, default: false
    add_column :users, :is_deleted, :boolean, default: false
  end
end
