class CreateTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :titles do |t|
      t.integer :user_id
      t.integer :theme_id
      t.text    :content
      t.timestamps
    end
  end
end
