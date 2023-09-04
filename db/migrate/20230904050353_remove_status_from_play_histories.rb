class RemoveStatusFromPlayHistories < ActiveRecord::Migration[6.1]
  def change
    remove_column :play_histories, :status, :integer
  end
end
