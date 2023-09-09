class ChangeDataMessageToRecruit < ActiveRecord::Migration[6.1]
  def change
    change_column :recruits, :message, :text
  end
end
