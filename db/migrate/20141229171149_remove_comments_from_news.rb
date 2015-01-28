class RemoveCommentsFromNews < ActiveRecord::Migration
  def change
    remove_reference :news, :comments, index: true
  end
end
