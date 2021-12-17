class CreateTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :titles do |t|
      t.integer :user_id
      t.integer :title_id
      t.text    :content
      t.timestamps
    end
  end
end
