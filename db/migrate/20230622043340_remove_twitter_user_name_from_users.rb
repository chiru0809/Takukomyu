class RemoveTwitterUserNameFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :twitter_user_name, :string
  end
end
