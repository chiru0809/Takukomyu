class AddStatusToRecruits < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits, :status, :integer, default: 0, null: false
  end
end
