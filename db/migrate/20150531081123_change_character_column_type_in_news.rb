class ChangeCharacterColumnTypeInNews < ActiveRecord::Migration
  def change
    change_column :news, :content, :string
  end
end
