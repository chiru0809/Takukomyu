class CreatePlayHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :play_histories do |t|
      t.integer :user_id, null: false
      t.integer :title_id, null: false
      t.string :scenario_name, null: false
      t.integer :play_style, null: false
      t.text :memo
      t.text :secret_memo
      t.boolean :is_active, null: false, default: false
      t.timestamps
    end
  end
end
