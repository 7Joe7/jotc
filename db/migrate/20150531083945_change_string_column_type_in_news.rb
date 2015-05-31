class ChangeStringColumnTypeInNews < ActiveRecord::Migration
  def change
    change_column :news, :content, :text
  end
end
