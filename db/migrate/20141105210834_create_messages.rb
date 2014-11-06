class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.string :email, index: true
      t.references :user, index: true

      t.timestamps
    end
    add_index :messages, [:user_id, :created_at]
    add_index :messages, [:email, :created_at]
  end
end
