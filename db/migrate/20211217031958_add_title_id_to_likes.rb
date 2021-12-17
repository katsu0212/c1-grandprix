class AddTitleIdToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :title_id, :integer
  end
end
