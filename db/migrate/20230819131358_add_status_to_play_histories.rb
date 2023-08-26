class AddStatusToPlayHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :play_histories, :status, :integer, default: 0, null: false
  end
end
