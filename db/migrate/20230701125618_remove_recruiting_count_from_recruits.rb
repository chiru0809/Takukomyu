class RemoveRecruitingCountFromRecruits < ActiveRecord::Migration[6.1]
  def change
    remove_column :recruits, :recruiting_count, :integer
  end
end
