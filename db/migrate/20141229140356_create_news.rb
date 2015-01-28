class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :content
      t.references :author, index: true
      t.references :comments, index: true

      t.timestamps
    end
  end
end
