class CreateRecruits < ActiveRecord::Migration[6.1]
  def change
    create_table :recruits do |t|
      t.integer :user_id, null: false
      t.integer :title_id, null: false
      t.string :scenario_name, null: false
      t.string :message
      t.integer :recruiting_count
      t.boolean :recruit_status, null: false, default: true
      t.timestamps
    end
  end
end
